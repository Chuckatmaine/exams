class QuestionLevel < ActiveRecord::Base
  attr_accessible :level_id, :question_id
  belongs_to :level
  belongs_to :question
end
