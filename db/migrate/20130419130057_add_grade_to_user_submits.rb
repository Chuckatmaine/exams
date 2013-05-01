class AddGradeToUserSubmits < ActiveRecord::Migration
  def change
    add_column :user_submits, :grade, :float
  end
end
