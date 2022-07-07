class Pokemon < ApplicationRecord
    has_many :posts
    has_many :persons, through: :posts

    def self.define_values(pokemon)
        poke = PokeApi.get(pokemon: pokemon.name.downcase)   
        pokemon.img_url = poke.sprites.front_default
        pokemon.description = PokeApi.get(pokemon_species: poke.name).flavor_text_entries.find{|entry| entry.language.name=="en"}.flavor_text.gsub('\n', ' ').gsub('\f', ' ') 
    end
end
