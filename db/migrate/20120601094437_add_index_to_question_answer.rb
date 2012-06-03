class AddIndexToQuestionAnswer < ActiveRecord::Migration
  def change
  end
  add_index :question_answers, :question_id
  add_index :question_answers, :answer_id
  add_index :question_answers, [:question_id, :answer_id], unique: true

end
