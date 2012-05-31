class AddLockedToTests < ActiveRecord::Migration
  def change
    add_column :tests, :locked, :boolean
  end
end
