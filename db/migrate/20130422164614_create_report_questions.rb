class CreateReportQuestions < ActiveRecord::Migration
  def change
    create_table :report_questions do |t|
      t.integer :report_id
      t.integer :question_id
      t.integer :correct
      t.integer :incorrect
      t.float :pvalue
      t.float :pbi

      t.timestamps
    end
  end
end
