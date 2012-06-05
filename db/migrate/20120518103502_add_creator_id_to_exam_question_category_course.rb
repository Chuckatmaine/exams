class AddCreatorIdToExamQuestionCategoryCourse < ActiveRecord::Migration
  def change
#    add_column :exams, :creator_id, :integer
#    add_column :questions, :creator_id, :integer
    add_column :answers, :creator_id, :integer
    add_column :courses, :creator_id, :integer
    add_column :categories, :creator_id, :integer
  end
end
