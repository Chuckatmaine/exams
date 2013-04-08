class RemoveEnableFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :enable
  end

  def down
  end
end
