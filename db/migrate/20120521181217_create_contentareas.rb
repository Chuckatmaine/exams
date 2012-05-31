class CreateContentareas < ActiveRecord::Migration
  def change
    create_table :contentareas do |t|
      t.string :name
      t.integer :department_id
      t.integer :creator

      t.timestamps
    end
  end
end
