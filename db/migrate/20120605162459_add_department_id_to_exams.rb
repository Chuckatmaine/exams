class AddDepartmentIdToExams < ActiveRecord::Migration
  def change
    add_column :exams, :department_id, :integer
  end
end
