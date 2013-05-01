class AddExamToReport < ActiveRecord::Migration
  def change
    add_column :reports, :exam, :integer
  end
end
