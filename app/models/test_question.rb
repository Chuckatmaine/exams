class TestQuestion < ActiveRecord::Base
  attr_accessible :question_id, :test_id, :name, :allow_destroy
  belongs_to :test
  belongs_to :question
  accepts_nested_attributes_for :question, :reject_if => lambda {|a| a[:name].blank? }
end
