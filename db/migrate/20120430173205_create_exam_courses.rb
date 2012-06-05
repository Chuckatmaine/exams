class CreateExamCourses < ActiveRecord::Migration
  def change
    create_table :exam_courses do |t|
      t.integer :exam_id
      t.integer :course_id

      t.timestamps
    end
  end
end
