class AddRationaleToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rationale, :text
  end
end
