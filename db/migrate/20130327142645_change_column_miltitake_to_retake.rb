class ChangeColumnMiltitakeToRetake < ActiveRecord::Migration
  def up
    rename_column :exams, :multitake, :retake
  end

  def down
  end
end
