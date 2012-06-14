class UserSubmit < ActiveRecord::Base
  attr_accessible :exam_id, :user_id
  has_many :user_answers
  belongs_to :exam
  belongs_to :user
end
