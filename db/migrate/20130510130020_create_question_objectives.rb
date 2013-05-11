class CreateQuestionObjectives < ActiveRecord::Migration
  def change
    create_table :question_objectives do |t|
      t.integer :question_id
      t.integer :objective_id
  
      t.timestamps
    end
  end
end
