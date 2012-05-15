class AddFacultyToUser < ActiveRecord::Migration
  def change
    add_column :users, :faculty, :boolean, :default => 0
  end
end
