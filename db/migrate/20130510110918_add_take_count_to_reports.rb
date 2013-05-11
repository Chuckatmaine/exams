class AddTakeCountToReports < ActiveRecord::Migration
  def change
    add_column :reports, :take_count, :integer
  end
end
