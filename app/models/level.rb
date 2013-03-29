class Level < ActiveRecord::Base
  belongs_to :exam
  belongs_to :creator, :class_name => "User"
  belongs_to :question
  belongs_to :department
  has_many :questions, :through => :question_levels
  has_many :exams, :through => :exam_levels
  validates :learning_level, :presence => true
  attr_accessible :level_id, :creator_id, :department_id, :learning_level, :locked
end
