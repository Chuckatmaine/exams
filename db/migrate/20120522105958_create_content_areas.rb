class CreateContentAreas < ActiveRecord::Migration
  def change
    create_table :content_areas do |t|
      t.string :name
      t.integer :department_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
