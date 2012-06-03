class AddLockedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :locked, :boolean
  end
end
