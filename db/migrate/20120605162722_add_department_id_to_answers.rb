class AddDepartmentIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :department_id, :integer
  end
end
