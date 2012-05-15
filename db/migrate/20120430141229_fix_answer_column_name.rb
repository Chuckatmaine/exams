class FixAnswerColumnName < ActiveRecord::Migration
  def up
    rename_column :question_answers, :test_id, :answer_id
  end

  def down
  end
end
