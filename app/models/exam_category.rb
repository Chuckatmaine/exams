class ExamCategory < ActiveRecord::Base
  belongs_to :exam
  belongs_to :category
  attr_accessible :category_id, :exam_id
end
