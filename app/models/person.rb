class Person < ApplicationRecord
    has_many :posts
    has_many :comments, through: :posts
    has_many :pokemons, through: :posts


    def most_common_type
        type_arr = self.posts.map{|post| post.pokemon.variety }    
        if posts.count > 0
            type_arr.max_by{|i| type_arr.count(i)}
        else
            ""
        end
    end

end
