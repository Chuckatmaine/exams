class ReportQuestion < ActiveRecord::Base
  belongs_to :report
  belongs_to :question
  attr_accessible :report_id, :question_id, :correct, :incorrect, :pvalue, :pbi

end
