class Objective < ActiveRecord::Base
  attr_accessible :creator_id, :department_id, :locked, :name
  belongs_to :creator, :class_name => "User"
  belongs_to :exam
  belongs_to :department
  has_many :questions
  validates :name, :presence => true
end
