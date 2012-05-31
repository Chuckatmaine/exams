class AddStartdatetimeEnddatetimeToTests < ActiveRecord::Migration
  def change
    add_column :tests, :start_date, :datetime
    add_column :tests, :end_date, :datetime
  end
end
