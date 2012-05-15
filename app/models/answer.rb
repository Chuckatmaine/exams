class Answer < ActiveRecord::Base
  attr_accessible :name
  has_many :question_answers
  has_many :questions, :through => :question_answers
end
