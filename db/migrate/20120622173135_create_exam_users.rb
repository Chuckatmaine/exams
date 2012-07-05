class CreateExamUsers < ActiveRecord::Migration
  def change
    create_table :exam_users do |t|
      t.integer :exam_id
      t.integer :user_id

      t.timestamps
    end
  end
end
