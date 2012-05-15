class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|
      t.integer :category_id
      t.integer :question_id

      t.timestamps
    end
  end
end
