class AddUserSubmitIdToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :user_submit_id, :integer
  end
end
