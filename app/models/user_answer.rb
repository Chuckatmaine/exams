class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_answer
  belongs_to :question
  belongs_to :exam_question
  belongs_to :exam
  attr_accessible :question_answer_id, :user_id
end
