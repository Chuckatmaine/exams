class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_answer
  belongs_to :question :through => :question_answer
  belongs_to :test_question :through => :question_answer
  belongs_to :test :through => :question
  attr_accessible :question_answer_id, :user_id
end
