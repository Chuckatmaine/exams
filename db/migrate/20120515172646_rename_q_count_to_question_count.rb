class RenameQCountToQuestionCount < ActiveRecord::Migration
  def up
    rename_column :exams, :q_count, :question_count
  end

  def down
  end
end
