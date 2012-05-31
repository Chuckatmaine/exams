class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :learning_level
      t.integer :department_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
