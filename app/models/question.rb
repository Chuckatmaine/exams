class Question < ActiveRecord::Base
  attr_accessible :answer_id, :creator_id, :course_id, :category_id, :is_correct, :level, :name, :value, :available, :locked
  has_many :tests, :through => :test_questions
  has_many :question_answers
  has_many :test_questions
  has_many :question_categories
  has_many :question_courses
  has_many :answers, :through => :question_answers
  has_many :categories, :through => :question_categories
  has_many :courses, :through => :question_courses
  has_many :user_answers, :through => :question_answers 
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  accepts_nested_attributes_for :courses, :categories, :test_questions, :question_categories, :question_courses,:reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :question_answers, :reject_if => lambda {|qa| qa[:answer_attributes][:name].blank? }, :allow_destroy => true
 
  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  attr_accessible :name, :level, :value, :creator, :categories, :answer, :courses, :question_answers, :test_questions, :question_categories, :question_courses, :question_courses_attributes, :question_categories_attributes, :answers_attributes, :category_ids, :course_ids, :question_answers_attributes

end
