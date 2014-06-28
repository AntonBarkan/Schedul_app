class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :submited_hours, :week_start_date,  :date
  end
end
