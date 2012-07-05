class ExamUser < ActiveRecord::Base
  attr_accessible :exam_id, :user_id
  belongs_to :exam
  belongs_to :user
end
