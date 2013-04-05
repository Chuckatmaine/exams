class Question < ActiveRecord::Base
  attr_accessible :answer_id, :creator_id, :course_id, :learning_objective, :category_id, :is_correct, :level, :name, :value, :available, :locked
  has_many :exams, :through => :exam_questions
  has_many :question_answers
  has_many :exam_questions
  has_many :question_content_areas
  has_many :question_levels
  has_many :question_courses
  has_many :answers, :through => :question_answers
  has_many :content_areas, :through => :question_content_areas
  has_many :levels, :through => :question_levels
  has_many :courses, :through => :question_courses
  has_many :user_answers, :through => :question_answers 
  belongs_to :creator, :class_name => "User"
  belongs_to :department
  accepts_nested_attributes_for :courses, :content_areas, :levels, :question_levels, :exam_questions, :question_content_areas, :question_courses,:reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :question_answers, :reject_if => lambda {|qa| qa[:answer_attributes][:name].blank? }, :allow_destroy => true
 
  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:name].blank? }, :allow_destroy => true
  attr_accessible :name, :level, :level_ids, :value, :creator, :content_areas, :answer, :rationale, :courses, :question_answers, :exam_questions, :question_content_areas, :question_courses, :question_courses_attributes, :question_content_areas_attributes, :answers_attributes, :content_area_ids, :course_ids, :question_answers_attributes
  validates :name, :learning_objective, :question_courses, :content_areas, :presence => true

end
