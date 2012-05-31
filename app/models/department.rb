class Department < ActiveRecord::Base
  attr_accessible :name, :code, :id
  has_many :users
end
