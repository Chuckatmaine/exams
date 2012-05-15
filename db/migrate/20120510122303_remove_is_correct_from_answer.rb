class RemoveIsCorrectFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :is_correct
  end

  def down
  end
end
