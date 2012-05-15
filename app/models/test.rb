class Test < ActiveRecord::Base
  attr_accessible :level, :title, :course_id, :available, :test_questions
  has_many :test_questions
  has_many :tests, :through => :test_questions
  belongs_to :course
end
