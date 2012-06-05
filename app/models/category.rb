class Category < ActiveRecord::Base
  attr_accessible :name, :id
  belongs_to :question
  belongs_to :creator, :class_name => "User"
  belongs_to :exam
  belongs_to :department
  has_many :questions, :through => :question_categories  
  has_many :exams, :through => :exam_categories
end
