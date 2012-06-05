class AddQuestionCountToExam < ActiveRecord::Migration
  def change
    add_column :exams, :q_count, :integer
  end
end
