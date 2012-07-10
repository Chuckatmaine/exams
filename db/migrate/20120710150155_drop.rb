class Drop < ActiveRecord::Migration
  def up
    drop_table :contentareas
  end

  def down
  end
end
