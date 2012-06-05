class ExamContentArea < ActiveRecord::Base
  belongs_to :exam
  belongs_to :content_area
  attr_accessible :content_area_id, :count, :exam_id
end
