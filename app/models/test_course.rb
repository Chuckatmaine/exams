class TestCourse < ActiveRecord::Base
  attr_accessible :course_id, :test_id
  belongs_to :test

end
