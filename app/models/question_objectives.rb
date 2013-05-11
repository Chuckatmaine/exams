class QuestionObjectives < ActiveRecord::Base
  attr_accessible :objective_id, :question_id
  belongs_to :question
  belongs_to :objective
end
