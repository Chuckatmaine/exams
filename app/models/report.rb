class Report < ActiveRecord::Base
  attr_accessible :creator, :department, :exam, :exam_mean, :exam_median, :high_score, :kr20, :low_score, :mean_p, :p_value, :pbi, :rundate, :sd, :sem, :variance
  belongs_to :user 
  belongs_to :exam 
  belongs_to :department
  belongs_to :creator, :class_name => "User"
  has_many :report_questions
  has_many :questions, :through => :report_questions
  has_many :report_question_answers

  def generate
    total = 0.0
    high = 'test' 
    scores = []
    scores = self.exam.user_submits.order("grade asc").map(&:grade)
    scores.sort
    len = scores.count
    submits = self.exam.user_submits.order("grade asc").all
    submits.each do |submit|
      unless submit.grade > 0
        calc_grade(submit)
      end
    end
    self.take_count = len
    self.qcount = self.exam.exam_questions.count
    total = scores.sum  
    self.exam_mean = total / len
    high = scores.last 
    low = scores.first
    self.high_score = high 
    self.low_score = low 
    sumofdif = 0.0
    dif = 0.0
    dif2 = 0.0
    scores.each do |g|
      dif = (self.exam_mean - g)
      sumofdif += (dif * dif) 
    end
    self.range = high - low
    self.variance = sumofdif / scores.count
    self.sd = Math.sqrt(self.variance)
    
   self.exam_median = scores.count % 2 == 1 ?  scores[len/2] : (scores[len/2 - 1] + scores[len/2]) / 2 
   mean_p = self.report_questions.sum(:pvalue) / self.qcount
   self.mean_p = mean_p
   self.save
  end

 def calc_grade(submit)
   logger.debug "\n\n *** \n\n Question " + submit.inspect + " ********* \n"
    grade = 0
    submit.exam.exam_questions.each do |tq|
    unless report_question = ReportQuestion.find(:first, :conditions =>{:report_id => self, :question_id => tq.question_id})
        report_question = ReportQuestion.new
        report_question.question = tq.question  
        report_question.report = self
   puts report_question
   logger.debug "\n\n *** \n\n Report Question " + report_question.inspect + " ********* \n"
        report_question.save!
        self.save
    end
    #tq.correct = 0
  # logger.debug "\n\n *** \n\n Question " + tq.inspect + " ********* \n"
    @uacount = submit.question_answers.where(:question_id => tq.question).count # how many user_answers for this question
    @correct = 0
    @count = 0
    tq.question.question_answers.each do |qa|
    #logger.debug "\n\n *** \n\n Answer " + qa.inspect + " ********* \n"
      unless rqa = ReportQuestionAnswer.find(:first, :conditions =>{:report_id => self, :question_answer_id => qa.id})
        rqa = ReportQuestionAnswer.new
        rqa.report_id = self.id
        rqa.question_answer_id = qa.id
        rqa.save
      end
      if submit.user_answers.where(:question_answer_id => qa)
        if qa.is_correct
          @correct = @correct + 1 # number of correct answers for this question
          @count = @count + 1 #correct answer matched count
        end
      end
      ua =  UserAnswer.where(:question_answer_id => qa).first
    rqa.count = UserAnswer.where(:question_answer_id => qa).count
    logger.debug "\n\n ** \n\n User Answer " + ua.inspect + " ********* \n"
        rqa.save!  
    end # end answers
    if @count == @correct && @count == @uacount # must have correct matching count and no extra answers
      grade = grade + 1
      report_question.increment(:correct)   
      #report_question.correct = grade
    logger.debug "\n\n *** \n\n grade " + report_question.inspect + "  " + grade.inspect + " ********* \n"
    else
      report_question.increment(:incorrect)   
    end
    answered = report_question.correct.to_f + report_question.incorrect.to_f
    report_question.pvalue = report_question.correct.to_f / answered
    report_question.save! 
   logger.debug "\n\n *** \n\n Report_Question " + report_question.inspect + " ********* \n"
    end #end questions
    logger.debug "\n\n *** \n\n grade2 "  + grade.inspect + " ********* \n"
    submit.grade = ((grade.to_f / submit.exam.question_count.to_f) * 100)
    submit.save
    return(submit.grade)
  end

end
