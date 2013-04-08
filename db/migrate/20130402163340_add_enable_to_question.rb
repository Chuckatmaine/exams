class AddEnableToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :enable, :boolean
  end
end
