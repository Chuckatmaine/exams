class CreateTestCourses < ActiveRecord::Migration
  def change
    create_table :test_courses do |t|
      t.integer :test_id
      t.integer :course_id

      t.timestamps
    end
  end
end
