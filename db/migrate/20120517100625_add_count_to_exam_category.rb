class AddCountToExamCategory < ActiveRecord::Migration
  def change
    add_column :exam_categories, :count, :integer
  end
end
