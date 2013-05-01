class AddDefaultValueToCountAttribute < ActiveRecord::Migration
  def change
    change_column :report_questions, :correct, :integer, :default => 0
  end
end
