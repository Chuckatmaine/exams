class CreateReportQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :report_question_answers do |t|
      t.integer :report_id
      t.integer :question_answer_id
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
