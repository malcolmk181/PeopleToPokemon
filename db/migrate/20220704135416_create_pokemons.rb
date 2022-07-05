class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :img_url
      t.string :description
      t.string :variety
      t.string :region

      t.timestamps
    end
  end
end
