class TestContentArea < ActiveRecord::Base
  belongs_to :test
  belongs_to :content_area
  attr_accessible :content_area_id, :count, :test_id
end
