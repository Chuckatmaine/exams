class Test < ActiveRecord::Base
  has_many :test_questions, :dependent => :destroy
  has_many :questionss, :through => :test_questions
  has_many :content_areas, :through => :test_content_areas
  has_many :test_content_areas
  belongs_to :course
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  attr_accessible :level, :title, :course_id, :available, :test_content_areas, :content_areas, :content_area_ids, :test_id, :question_count, :start_date, :end_date, :department_id
  attr_accessible :test_questions, :allow_destroy => true
  accepts_nested_attributes_for :content_areas, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :test_content_areas
  validates :title, :course, :level, :presence => true
  validates :question_count, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 100 }
end
