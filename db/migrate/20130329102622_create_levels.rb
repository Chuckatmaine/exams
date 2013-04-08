class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :learning_level
      t.integer :department_id
      t.integer :creator_id
      t.boolean :locked

      t.timestamps
    end
  end
end
