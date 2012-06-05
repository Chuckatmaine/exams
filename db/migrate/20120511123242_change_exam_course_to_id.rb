class ChangeExamCourseToId < ActiveRecord::Migration
  def up
    rename_column :exams, :course, :course_id

  end

  def down
  end
end
