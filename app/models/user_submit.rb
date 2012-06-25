class UserSubmit < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  has_many :user_answers
  has_many :question_answers, :through => :user_answers
  attr_accessible :user_answers_attributes, :exam_id, :user_id, :user_answers, :user_answer_ids, :examid
  accepts_nested_attributes_for :user_answers, :allow_destroy => true
end
