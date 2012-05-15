class QuestionAnswer < ActiveRecord::Base
  attr_accessible :question_id, :answer_id, :is_correct
  belongs_to :question
  belongs_to :answer
  belongs_to :test_question
  has_many :user_answers

  accepts_nested_attributes_for :answer
  attr_accessible :answer, :answer_attributes
end
