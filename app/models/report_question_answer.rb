class ReportQuestionAnswer < ActiveRecord::Base
  belongs_to :report
  has_one :question_answer
  attr_accessible :count, :question_answer_id, :report_id
end
