class AddLockedToContentAreas < ActiveRecord::Migration
  def change
    add_column :content_areas, :locked, :boolean
  end
end
