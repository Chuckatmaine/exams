class CreateReportUsers < ActiveRecord::Migration
  def change
    create_table :report_users do |t|

      t.timestamps
    end
  end
end
