class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :level
      t.integer :value
      t.integer :creator_id

      t.timestamps
    end
  end
end
