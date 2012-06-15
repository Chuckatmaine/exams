class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_answer
  belongs_to :question
  belongs_to :exam_question
  belongs_to :exam
  belongs_to :user_submit
  attr_accessible :id, :question_answer_id, :user_id, :user_submit_id
end
