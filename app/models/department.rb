class Department < ActiveRecord::Base
  attr_accessible :name, :code, :id
  has_many :users
  has_many :reports
  validates :name, :presence => true
end
