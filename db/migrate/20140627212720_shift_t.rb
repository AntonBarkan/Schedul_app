class ShiftT < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :week_number
      t.string :shift_name
      t.integer :user_id
    end
  end
end
