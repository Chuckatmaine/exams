class AddIscorrectToQa < ActiveRecord::Migration
  def change
     add_column :question_answers, :is_correct, :boolean
  end
end
