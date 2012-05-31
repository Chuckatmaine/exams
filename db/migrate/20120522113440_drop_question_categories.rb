class DropQuestionCategories < ActiveRecord::Migration
  def up
    drop_table :question_categories
  end

  def down
  end
end
