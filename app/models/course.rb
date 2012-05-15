class Course < ActiveRecord::Base
  attr_accessible :id, :name
  belongs_to :test
  belongs_to :question
  has_many :questions, :through => :question_courses
  has_many :tests
end
