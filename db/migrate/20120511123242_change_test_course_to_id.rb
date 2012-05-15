class ChangeTestCourseToId < ActiveRecord::Migration
  def up
    rename_column :tests, :course, :course_id

  end

  def down
  end
end
