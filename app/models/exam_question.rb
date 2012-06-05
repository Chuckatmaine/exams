class ExamQuestion < ActiveRecord::Base
  attr_accessible :question_id, :exam_id, :question, :name, :allow_destroy
  belongs_to :exam
  belongs_to :question
  accepts_nested_attributes_for :question, :reject_if => lambda {|a| a[:name].blank? }
  validates_presence_of :exam_id, :question_id
end
