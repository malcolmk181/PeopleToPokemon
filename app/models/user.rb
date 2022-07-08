class User < ApplicationRecord
    has_many :comments
    has_many :posts

    validates :name, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }

    has_secure_password
end