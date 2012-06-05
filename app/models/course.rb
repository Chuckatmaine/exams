class Course < ActiveRecord::Base
  attr_accessible :id, :name, :locked
  belongs_to :exam
  belongs_to :creator, :class_name => "User"
  belongs_to :question
  belongs_to :department
  has_many :questions, :through => :question_courses
  has_many :exams
end
