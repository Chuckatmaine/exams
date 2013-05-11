class RemoveColumnLearningObjectiveFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :learning_objective
  end

  def down
  end
end
