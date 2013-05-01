class RenameColumnCreatorToCreatorId < ActiveRecord::Migration
  def up
    rename_column :reports, :creator, :creator_id
  end

  def down
  end
end
