class Post < ApplicationRecord
  belongs_to :person
  belongs_to :pokemon
  has_many :comments

  def likes
    total = 0
    comments.each {|c| c.vote ? total += 1 : total -= 1 }
    total
  end
end
