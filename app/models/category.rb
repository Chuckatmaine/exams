class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :question
  has_many :questions, :through => :question_categories  
end
