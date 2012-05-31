class TestCategory < ActiveRecord::Base
  belongs_to :test
  belongs_to :category
  attr_accessible :category_id, :test_id
end
