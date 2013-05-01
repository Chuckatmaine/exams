class RemovePbiFromReport < ActiveRecord::Migration
  def up
    remove_column :reports, :pbi
  end

  def down
  end
end
