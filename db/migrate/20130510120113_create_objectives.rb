class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.text :name
      t.integer :creator_id
      t.integer :department_id
      t.boolean :locked, :default => 0

      t.timestamps
    end
  end
end
