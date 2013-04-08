class AddShowResultsToExams < ActiveRecord::Migration
  def change
    add_column :exams, :show_results, :boolean
  end
end
