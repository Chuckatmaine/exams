class CreateQuestionContentAreas < ActiveRecord::Migration
  def change
    create_table :question_content_areas do |t|
      t.integer :question_id
      t.integer :content_area_id

      t.timestamps
    end
  end
end
