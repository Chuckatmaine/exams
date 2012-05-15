class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :test_id
      t.integer :question_id

      t.timestamps
    end
  end
end
