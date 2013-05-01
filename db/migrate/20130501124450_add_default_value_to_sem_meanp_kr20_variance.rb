class AddDefaultValueToSemMeanpKr20Variance < ActiveRecord::Migration
  def change
    change_column :reports, :exam_mean, :float, :default => 0
    change_column :reports, :exam_median, :float, :default => 0
    change_column :reports, :low_score, :float, :default => 0
    change_column :reports, :high_score, :float, :default => 0
    change_column :reports, :kr20, :float, :default => 0
    change_column :reports, :variance, :float, :default => 0
    change_column :reports, :sd, :float, :default => 0
    change_column :reports, :sem, :float, :default => 0
    change_column :reports, :mean_p, :float, :default => 0
  end
end
