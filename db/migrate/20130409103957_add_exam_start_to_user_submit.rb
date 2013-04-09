class AddExamStartToUserSubmit < ActiveRecord::Migration
  def change
    add_column :user_submits, :exam_start, :datetime
  end
end
