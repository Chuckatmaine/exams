class ContentArea < ActiveRecord::Base
  attr_accessible :name, :id
  belongs_to :question
  belongs_to :creator, :class_name => "User"
  belongs_to :exam
  belongs_to :department
  has_many :questions, :through => :question_content_areas  
  has_many :exams, :through => :exam_content_areas
  attr_accessible :creator_id, :department_id, :name 
  validates :name, :presence => true
end
