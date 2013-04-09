class DropExamStartFromUserSubmit < ActiveRecord::Migration
  def up
    remove_column :user_submits, :exam_start
  end

  def down
  end
end
