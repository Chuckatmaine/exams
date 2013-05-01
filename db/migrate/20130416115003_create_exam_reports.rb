class CreateExamReports < ActiveRecord::Migration
  def change
    create_table :exam_reports do |t|
      t.integer :exam
      t.integer :report

      t.timestamps
    end
  end
end
