class Exam < ActiveRecord::Base
  has_many :exam_questions, :dependent => :destroy
  has_many :questionss, :through => :exam_questions
  has_many :content_areas, :through => :exam_content_areas
  has_many :exam_content_areas
  belongs_to :course
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  attr_accessible :level, :title, :course_id, :available, :exam_content_areas, :content_areas, :content_area_ids, :exam_id, :question_count, :start_date, :end_date, :department_id
  attr_accessible :exam_questions, :allow_destroy => true
  accepts_nested_attributes_for :content_areas, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :exam_content_areas
  validates :title, :course, :level, :presence => true
  validates :question_count, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 100 }
end
