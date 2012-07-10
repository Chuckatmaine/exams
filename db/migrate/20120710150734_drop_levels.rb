class DropLevels < ActiveRecord::Migration
  def up
    drop_table :levels
  end

  def down
  end
end
