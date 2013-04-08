class CreateExamLevels < ActiveRecord::Migration
  def change
    create_table :exam_levels do |t|
      t.integer :exam_id
      t.integer :level_id

      t.timestamps
    end
  end
end
