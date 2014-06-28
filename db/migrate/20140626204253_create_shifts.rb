class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :name
      t.string :worker
      t.timestamps
    end
  end
end
