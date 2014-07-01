class ShiftT < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :week_number
      t.string :shift_name
      t.integer :user_id
    end
  end
end
