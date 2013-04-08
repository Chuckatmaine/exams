class AddLockedToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :locked, :boolean
  end
end
