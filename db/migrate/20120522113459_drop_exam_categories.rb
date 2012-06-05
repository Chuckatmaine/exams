class DropExamCategories < ActiveRecord::Migration
  def up
    drop_table :exam_categories
  end

  def down
  end
end
