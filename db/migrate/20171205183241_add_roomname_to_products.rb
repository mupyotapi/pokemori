class AddRoomnameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :roomname, :string
  end
end
