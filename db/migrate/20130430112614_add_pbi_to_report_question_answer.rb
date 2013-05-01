class AddPbiToReportQuestionAnswer < ActiveRecord::Migration
  def change
    add_column :report_question_answers, :pbi, :float
  end
end
