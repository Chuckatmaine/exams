class Answer < ActiveRecord::Base
  attr_accessible :name, :rationale, :department_id, :creator_id
  has_many :question_answers
  has_many :questions, :through => :question_answers
  belongs_to :creator, :class_name => "User"
  belongs_to :department
end
