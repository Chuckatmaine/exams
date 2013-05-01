class AddDefaultValueToIncorrect < ActiveRecord::Migration
  def change
    change_column :report_questions, :incorrect, :integer, :default => 0
  end
end
