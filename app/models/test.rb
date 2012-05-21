class Test < ActiveRecord::Base
  has_many :test_questions
  has_many :tests, :through => :test_questions
  has_many :categories, :through => :test_categories
  has_many :test_categories
  belongs_to :course
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  attr_accessible :level, :title, :course_id, :available, :test_categories, :test_questions, :categories, :category_ids, :test_id, :question_count, :start_date, :end_date, :department_id
  accepts_nested_attributes_for :categories,:reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :test_categories
  validates :title, :course, :level, :presence => true
  validates :question_count, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 100 }
end
