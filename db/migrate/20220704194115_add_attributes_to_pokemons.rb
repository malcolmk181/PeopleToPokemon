class AddAttributesToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :description, :text
    add_column :pokemons, :img_url, :string
  end
end
