class CreateUserSubmits < ActiveRecord::Migration
  def change
    create_table :user_submits do |t|
      t.integer :user_id
      t.integer :exam_id

      t.timestamps
    end
  end
end
