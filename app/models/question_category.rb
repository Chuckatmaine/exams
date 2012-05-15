class QuestionCategory < ActiveRecord::Base
  attr_accessible :category_id, :question_id
  belongs_to :question
  belongs_to :category
end
