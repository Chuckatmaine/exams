class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.integer :exam_id
      t.integer :question_id

      t.timestamps
    end
  end
end
