class CreateExamCategories < ActiveRecord::Migration
  def change
    create_table :exam_categories do |t|
      t.integer :exam_id
      t.integer :category_id

      t.timestamps
    end
  end
end
