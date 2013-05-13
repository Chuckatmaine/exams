class Department < ActiveRecord::Base
  attr_accessible :name, :code, :id
  has_many :users
  has_many :reports
  has_many :client_needs
  validates :name, :presence => true
end
