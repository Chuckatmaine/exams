class ChangePvaluePbiToFloat < ActiveRecord::Migration
  def up
    change_column :report_questions, :pvalue, :float, :default => 0.0
    change_column :report_questions, :pbi, :float, :default => 0.0
  end

  def down
  end
end
