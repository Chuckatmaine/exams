class ChangeTestCourseToInt < ActiveRecord::Migration
 def up
   change_column :tests, :course, :integer
  end

  def down
  end
end
