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
    new_poke = Pokemon.new(name: PokeApi.get(pokemon: x).name)
    new_poke.define_values
    new_poke.save
    x+=1
end

Person.create(name: 'Malcolm')