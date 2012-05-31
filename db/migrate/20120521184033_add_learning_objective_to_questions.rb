class AddLearningObjectiveToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :learning_objective, :string
  end
end
