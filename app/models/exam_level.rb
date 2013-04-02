class ExamLevel < ActiveRecord::Base
  belongs_to :exam
  belongs_to :level
  attr_accessible :exam_id, :level_id
end
