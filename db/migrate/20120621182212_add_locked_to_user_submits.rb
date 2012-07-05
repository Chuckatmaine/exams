class AddLockedToUserSubmits < ActiveRecord::Migration
  def change
    add_column :user_submits, :locked, :boolean
  end
end
