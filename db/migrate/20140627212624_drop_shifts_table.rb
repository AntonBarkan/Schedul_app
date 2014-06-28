class DropShiftsTable < ActiveRecord::Migration
  def change
    drop_table :Shifts
  end
end
