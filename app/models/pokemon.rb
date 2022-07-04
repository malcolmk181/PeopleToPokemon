class Pokemon < ApplicationRecord
    has_many :posts
    has_many :persons, through: :posts
end
