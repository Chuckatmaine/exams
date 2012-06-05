class AddLockedToExams < ActiveRecord::Migration
  def change
    add_column :exams, :locked, :boolean
  end
end
