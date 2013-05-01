class AddQcountToReport < ActiveRecord::Migration
  def change
    add_column :reports, :qcount, :integer
  end
end
