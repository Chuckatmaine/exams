class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :level

      t.timestamps
    end
  end
end
