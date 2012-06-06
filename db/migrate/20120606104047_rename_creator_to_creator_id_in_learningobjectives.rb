class RenameCreatorToCreatorIdInLearningobjectives < ActiveRecord::Migration
  def up
    rename_column :learningobjectives, :creator, :creator_id
  end

  def down
  end
end
