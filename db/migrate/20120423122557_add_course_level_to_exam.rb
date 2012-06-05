class AddCourseLevelToExam < ActiveRecord::Migration
  def change
    add_column :exams, :course, :string
    add_column :exams, :available, :boolean, :default => false
  end
end
