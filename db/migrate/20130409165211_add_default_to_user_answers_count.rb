class AddDefaultToUserAnswersCount < ActiveRecord::Migration
  def change
    change_column :user_submits, :user_answers_count, :integer, :default => 0
  end
end
