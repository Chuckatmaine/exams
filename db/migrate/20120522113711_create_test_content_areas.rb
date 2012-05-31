class CreateTestContentAreas < ActiveRecord::Migration
  def change
    create_table :test_content_areas do |t|
      t.integer :test_id
      t.integer :content_area_id
      t.integer :count

      t.timestamps
    end
  end
end
