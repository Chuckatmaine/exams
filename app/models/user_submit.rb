class UserSubmit < ActiveRecord::Base
  attr_accessible :exam_id, :user_id, :user_answers, :user_answer_ids, :examid
  has_many :user_answers
  has_many :question_answers, :through => :user_answers
  belongs_to :exam
  belongs_to :user
  accepts_nested_attributes_for :user_answers
end
