class CreateNewShiftsTable < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :week_number
      t.string :shift_name
      t.string :user_id
    end
  end
end
