class Category < ActiveRecord::Base
  attr_accessible :name, :id
  belongs_to :question
  belongs_to :test
  has_many :questions, :through => :question_categories  
  has_many :tests, :through => :test_categories
end
