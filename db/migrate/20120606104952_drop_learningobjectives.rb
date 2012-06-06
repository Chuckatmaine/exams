class DropLearningobjectives < ActiveRecord::Migration
  def up
    drop_table :learningobjectives
  end

  def down
  end
end
