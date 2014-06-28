class AddNewColToUser < ActiveRecord::Migration
  def change
    add_column :users, :l_name, :string
    add_column :users, :phone, :string
  end
end
