class AddUserAnswersCountToUserSubmit < ActiveRecord::Migration
  def change
    add_column :user_submits, :user_answers_count, :integer
  end
end
