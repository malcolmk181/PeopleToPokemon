class Post < ApplicationRecord
  belongs_to :person
  belongs_to :pokemon
  has_many :comments
  validates :content, length: {minimum: 20}


  def likes
    total = 0
    comments.each {|c| c.vote ? total += 1 : total -= 1 }
    total
  end

  def pokemon_name
    if pokemon
      pokemon.name
    else
      ""
    end
  end
  
  def pokemon_name=(name)
    self.pokemon = Pokemon.find_by(name: name)
    self.save
  end
end
