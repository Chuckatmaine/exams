class RemoveLevelFrom < ActiveRecord::Migration
  def up
    remove_column :questions, :level
  end

  def down
  end
end
