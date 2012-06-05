class ExamCourse < ActiveRecord::Base
  attr_accessible :course_id, :exam_id
  belongs_to :exam

end
