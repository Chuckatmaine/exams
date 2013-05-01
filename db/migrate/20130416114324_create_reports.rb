class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime :rundate
      t.integer :creator
      t.integer :department
      t.float :exam_mean
      t.float :exam_median
      t.float :low_score
      t.float :high_score
      t.float :kr20
      t.float :variance
      t.float :sd
      t.float :sem
      t.float :p_value
      t.float :mean_p
      t.float :pbi

      t.timestamps
    end
  end
end
