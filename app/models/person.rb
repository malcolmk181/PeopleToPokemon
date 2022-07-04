class Person < ApplicationRecord
    has_many :posts
    has_many :pokemons, through: :posts
end
