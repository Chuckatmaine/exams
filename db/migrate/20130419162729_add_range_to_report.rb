class AddRangeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :range, :float
  end
end
