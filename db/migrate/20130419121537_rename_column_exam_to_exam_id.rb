class RenameColumnExamToExamId < ActiveRecord::Migration
  def up
    rename_column :reports, :exam, :exam_id
  end

  def down
  end
end
