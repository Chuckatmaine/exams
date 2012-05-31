class AddCountToTestCategory < ActiveRecord::Migration
  def change
    add_column :test_categories, :count, :integer
  end
end
