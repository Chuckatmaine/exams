class ChangeExamCourseToInt < ActiveRecord::Migration
 def up
   change_column :exams, :course, :integer
  end

  def down
  end
end
