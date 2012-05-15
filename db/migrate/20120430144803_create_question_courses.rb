class CreateQuestionCourses < ActiveRecord::Migration
  def change
    create_table :question_courses do |t|
      t.integer :question_id
      t.integer :course_id

      t.timestamps
    end
  end
end
