class AddLockedToQuestion < ActiveRecord::Migration
  def change
	  add_column :questions, :locked, :boolean, :default => 0
  end
end
