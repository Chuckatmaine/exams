class CreateExamContentAreas < ActiveRecord::Migration
  def change
    create_table :exam_content_areas do |t|
      t.integer :exam_id
      t.integer :content_area_id
      t.integer :count

      t.timestamps
    end
  end
end
