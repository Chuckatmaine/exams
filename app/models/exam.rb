class Exam < ActiveRecord::Base
  has_many :exam_questions, :dependent => :destroy
  has_many :questions, :through => :exam_questions
  has_many :content_areas, :through => :exam_content_areas
  has_many :exam_content_areas
  has_many :user_submits
  has_many :users, :through => :user_submits
  belongs_to :course
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  attr_accessible :level, :title, :course_id, :available, :exam_content_areas, :content_areas, :content_area_ids, :exam_id, :question_count, :start_date, :end_date, :department_id
  attr_accessible :exam_questions, :allow_destroy => true
  accepts_nested_attributes_for :content_areas, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :exam_content_areas
  validates :title, :course, :level, :presence => true
  validates :question_count, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 100 }
def generate
    @qtmp = 0 # flag that content areas matched
    @qcount = 0 #questions selected for exam
    @questions = Question.where(:available && :department_id => self.department).order('rand()')
    @questions.each do |q|
#      logger.debug "\n\n ***  Checking question # " + q.id.to_s + " ********* \n"
      q.courses.each do |qc|
#        logger.debug "\n\n ***  Checking courses " + qc.id.to_s + " " + self.course_id.to_s + " ********* \n"
        if qc.id == self.course_id
          q.content_areas.each do |qca|
#            logger.debug "\n\n ***  QCA = " + qca.id.to_s + " " + self.course_id.to_s + " ********* \n"
            self.content_areas.each do |tca|
#             logger.debug "\n\n *** Checking qca vs tca " + qca.id.to_s + " " + tca.id.to_s + " ********* \n"
             if qca == tca  
#               logger.debug "\n\n ***  Generate tca " + tca.id.to_s + " ********* \n"
               @qtmp = 1 
               tca.locked = 1
               tca.save!
             end
            end
          end
        end
      end
#      logger.debug "\n\n *** Checking qtmp and qcount vs question count " + @qtmp.to_s + " " + @qcount.to_s + " " + self.question_count.to_s + " ********* \n"
      if @qtmp == 1 && @qcount < self.question_count 
        @tq = self.exam_questions.build :question => q
#        logger.debug "\n\n *** \n\n Creating Exam Question ID = " + q.id.to_s + " ********* \n"
        @tq.save!
        @qcount = @qcount + 1 
      end
      @qtmp = 0
    end
    if @qcount < self.question_count
      @message =  "Not enough questions were available that fit the requested parameters (Max available: " + @qcount.to_s + " ).  Exam NOT created!"
      self.cleanup
      self.question_count = 0 
      return(@message)       
    else
      self.locked = 1
      self.course.locked = 1
      return "Exam was created successfully!"
    end
  end
  def cleanup
    self.exam_questions.each do |tq|
  # logger.debug "\n\n *** \n\n Cleaning up. \n\n" + tq.id.to_s + "\n\n ********* \n"
    tq.delete
    end
    self.locked = 0
    self.available = 0
    self.save
  end
end
