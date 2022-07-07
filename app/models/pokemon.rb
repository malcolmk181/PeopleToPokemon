class Pokemon < ApplicationRecord
    has_many :posts
    has_many :persons, through: :posts

    def define_values
        poke = PokeApi.get(pokemon: self.name.downcase)   
        self.img_url = poke.sprites.front_default
        self.variety = poke.types.first.type.name
        self.region = PokeApi.get(generation: self.generation).main_region.name.capitalize
        self.description = PokeApi.get(pokemon_species: poke.name).flavor_text_entries.find{|entry| entry.language.name=="en"}.flavor_text.gsub('\n', ' ').gsub('\f', ' ') 
    end

    def generation
        poke = PokeApi.get(pokemon: self.name.downcase) 
        PokeApi.get(pokemon_species: poke.name).generation.name
    end

    def self.type_imgs
        {normal: "https://upload.wikimedia.org/wikipedia/commons/a/aa/Pok%C3%A9mon_Normal_Type_Icon.svg", bug: "https://upload.wikimedia.org/wikipedia/commons/3/3c/Pok%C3%A9mon_Bug_Type_Icon.svg", dark: "https://upload.wikimedia.org/wikipedia/commons/0/09/Pok%C3%A9mon_Dark_Type_Icon.svg", dark: "https://upload.wikimedia.org/wikipedia/commons/a/a6/Pok%C3%A9mon_Dragon_Type_Icon.svg", electric: "https://upload.wikimedia.org/wikipedia/commons/a/a9/Pok%C3%A9mon_Electric_Type_Icon.svg", fairy: "https://upload.wikimedia.org/wikipedia/commons/0/08/Pok%C3%A9mon_Fairy_Type_Icon.svg", fighting: "https://upload.wikimedia.org/wikipedia/commons/b/be/Pok%C3%A9mon_Fighting_Type_Icon.svg", fire: "https://upload.wikimedia.org/wikipedia/commons/5/56/Pok%C3%A9mon_Fire_Type_Icon.svg", flying: "https://upload.wikimedia.org/wikipedia/commons/e/e0/Pok%C3%A9mon_Flying_Type_Icon.svg", ghost: "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pok%C3%A9mon_Ghost_Type_Icon.svg", grass: "https://upload.wikimedia.org/wikipedia/commons/f/f6/Pok%C3%A9mon_Grass_Type_Icon.svg", ground: "https://upload.wikimedia.org/wikipedia/commons/8/8d/Pok%C3%A9mon_Ground_Type_Icon.svg", ice: "https://upload.wikimedia.org/wikipedia/commons/8/88/Pok%C3%A9mon_Ice_Type_Icon.svg", poison: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Pok%C3%A9mon_Poison_Type_Icon.svg", psychic: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Pok%C3%A9mon_Psychic_Type_Icon.svg", rock: "https://upload.wikimedia.org/wikipedia/commons/b/bb/Pok%C3%A9mon_Rock_Type_Icon.svg", steel: "https://upload.wikimedia.org/wikipedia/commons/3/38/Pok%C3%A9mon_Steel_Type_Icon.svg", water: "https://upload.wikimedia.org/wikipedia/commons/0/0b/Pok%C3%A9mon_Water_Type_Icon.svg"}
    end

    def type_img
        Pokemon.type_imgs[self.variety.to_sym]
    end
end
