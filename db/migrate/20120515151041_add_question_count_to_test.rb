class AddQuestionCountToTest < ActiveRecord::Migration
  def change
    add_column :tests, :q_count, :integer
  end
end
