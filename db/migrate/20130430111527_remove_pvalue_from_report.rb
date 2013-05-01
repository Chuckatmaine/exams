class RemovePvalueFromReport < ActiveRecord::Migration
  def up
    remove_column :reports, :p_value
  end

  def down
  end
end
