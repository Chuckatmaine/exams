class CreateLearningobjectives < ActiveRecord::Migration
  def change
    create_table :learningobjectives do |t|
      t.string :objective
      t.integer :department_id
      t.integer :creator

      t.timestamps
    end
  end
end
