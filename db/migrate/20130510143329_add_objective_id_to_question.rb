class AddObjectiveIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :objective_id, :integer
  end
end
