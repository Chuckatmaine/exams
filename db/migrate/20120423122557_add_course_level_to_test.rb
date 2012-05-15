class AddCourseLevelToTest < ActiveRecord::Migration
  def change
    add_column :tests, :course, :string
    add_column :tests, :available, :boolean, :default => false
  end
end
