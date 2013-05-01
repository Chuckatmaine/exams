class ExamReport < ActiveRecord::Base
  attr_accessible :exam, :report
  has_one :reports
  belongs_to :exam
end
