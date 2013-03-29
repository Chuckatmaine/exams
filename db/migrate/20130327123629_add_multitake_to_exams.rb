class AddMultitakeToExams < ActiveRecord::Migration
  def change
    add_column :exams, :multitake, :boolean
  end
end
