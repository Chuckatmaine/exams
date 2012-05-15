class AddAvailableToQuestions < ActiveRecord::Migration
  def change
   add_column :questions, :available, :boolean, :default => true 
  end
end
