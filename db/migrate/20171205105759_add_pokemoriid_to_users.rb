class AddPokemoriidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pokemoriid, :integer
  end
end
