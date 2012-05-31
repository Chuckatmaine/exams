class CreateTestCategories < ActiveRecord::Migration
  def change
    create_table :test_categories do |t|
      t.integer :test_id
      t.integer :category_id

      t.timestamps
    end
  end
end
