class AddNewColums < ActiveRecord::Migration
  def change
    add_column :users, :id_number, :string
    add_column :users, :position, :string
    add_column :users, :shabat, :string
  end
end
