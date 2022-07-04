class Pokemon < ApplicationRecord
    has_many :posts
    has_many :persons, through: :posts

    def define_values
        poke = PokeApi.get(pokemon: self.name.downcase)   
        self.img_url = poke.sprites.front_default
        self.description = PokeApi.get(pokemon_species: poke.name).flavor_text_entries.find{|entry| entry.language.name=="en"}.flavor_text
        self.save
    end
end
