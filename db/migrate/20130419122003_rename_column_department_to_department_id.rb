class RenameColumnDepartmentToDepartmentId < ActiveRecord::Migration
  def up
    rename_column :reports, :department, :department_id
  end

  def down
  end
end
