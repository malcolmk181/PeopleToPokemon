class Person < ApplicationRecord
    has_many :posts
    has_many :comments, through: :posts
    has_many :pokemons, through: :posts


    def most_common_type
        type_arr = self.posts.map{|post| post.pokemon.variety }
        type_arr.max_by{|i| type_arr.count(i)}
    end


end
