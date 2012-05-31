class TestQuestion < ActiveRecord::Base
  attr_accessible :question_id, :test_id, :allow_destroy
end
