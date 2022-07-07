# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Person.delete_all
Pokemon.delete_all
Post.delete_all
x = 1
100.times do
    poke = PokeApi.get(pokemon: x)
    new_poke = Pokemon.new(name: poke.name, img_url: poke.sprites.front_default, variety: poke.types.first.type.name)
    new_poke.description = PokeApi.get(pokemon_species: poke.name).flavor_text_entries.find{|entry| entry.language.name=="en"}.flavor_text.gsub('\\n', ' ').gsub('\\f', ' ') 
    new_poke.save
    x+=1
end

Person.create(name: 'Malcolm')