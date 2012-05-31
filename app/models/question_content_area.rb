class QuestionContentArea < ActiveRecord::Base
  attr_accessible :content_area_id, :question_id
  belongs_to :question
  belongs_to :content_area
end
