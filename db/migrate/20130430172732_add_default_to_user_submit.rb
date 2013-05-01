class AddDefaultToUserSubmit < ActiveRecord::Migration
  def change
    add_column :user_submits, :take_count, :integer, :default => 0
  end
end
