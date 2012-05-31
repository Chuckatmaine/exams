class DropTestCategories < ActiveRecord::Migration
  def up
    drop_table :test_categories
  end

  def down
  end
end
