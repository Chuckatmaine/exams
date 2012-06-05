class AddStartdatetimeEnddatetimeToExams < ActiveRecord::Migration
  def change
    add_column :exams, :start_date, :datetime
    add_column :exams, :end_date, :datetime
  end
end
