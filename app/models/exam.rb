class Exam < ActiveRecord::Base
  has_many :exam_questions, :dependent => :destroy
  has_many :questions, :through => :exam_questions
  has_many :question_answers, :through => :questions
  has_many :answers, :through => :question_answers
  has_many :content_areas, :through => :exam_content_areas
  has_many :levels, :through => :exam_levels
  has_many :exam_content_areas
  has_many :exam_levels
  has_many :user_submits
  has_many :exam_users
  has_many :user_answers, :through => :user_submits
  has_many :users, :through => :user_submits
  has_many :users, :through => :exam_users
  belongs_to :course
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  attr_accessible :level_ids, :levels, :learning_level, :title, :course_id, :available, :exam_content_areas, :content_areas, :content_area_ids, :retake, :exam_id, :question_count, :start_date, :end_date, :department_id
  attr_accessible :exam_questions, :allow_destroy => true
  accepts_nested_attributes_for :content_areas, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :exam_content_areas
  accepts_nested_attributes_for :exam_levels, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  validates :title, :course, :presence => true
  validates :question_count, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 500 }
 
 def generate
    @qtmp = 0 # flag that content areas matched
    @qcount = 0 #questions selected for exam
    @questions = Question.where(:available => true, :department_id => self.department).order('rand()')
    @questions.each do |q|
      q.courses.each do |qc|
        if qc.id == self.course_id
          q.content_areas.each do |qca|
            self.content_areas.each do |tca|
             if qca == tca  
               @qtmp = 1 
               tca.locked = 1
               tca.save!
             end
            end
          end
        end
      end
      if @qtmp == 1 && @qcount < self.question_count 
        @tq = self.exam_questions.build :question => q
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
      self.course.save
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
  def calc_grade(submit)
    grade = 0
    self.exam_questions.each do |tq|
  # logger.debug "\n\n *** \n\n Question " + tq.inspect + " ********* \n"
    @uacount = submit.question_answers.where(:question_id => tq.question).count # how many user_answers for this question
    @correct = 0
    @count = 0
    tq.question.question_answers.each do |qa|
    #logger.debug "\n\n *** \n\n Answer " + qa.inspect + " ********* \n"
      if qa.is_correct
        @correct = @correct + 1 # number of correct answers for this question
        @ua = submit.user_answers.where(:question_answer_id => qa).each do |m| # match user answers to correct answers
        @count = @count + 1 #correct answer matched count
    #logger.debug "\n\n *** \n\n Correct Answer " + qa.inspect + " ********* \n"
    #logger.debug "\n\n *** \n\n User Answer " + m.inspect + " ********* \n"
    #logger.debug "\n\n *** \n\n Count " + @count.inspect + " ********* \n"
        end
      end
    end # end answers
    if @count == @correct && @count == @uacount # must have correct matching count and no extra answers
      grade = grade + 1
    #logger.debug "\n\n *** \n\n grade " + grade.inspect + " ********* \n"
    end
    end #end questions
    grade = ((grade.to_f / self.question_count.to_f) * 100)
    return(grade)
  end
end
