# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Pokemon.delete_all # don't delete unless you want to reseed all the pokemon (unnecessary)
Person.delete_all
Comment.delete_all
Post.delete_all

# Seed the first 100 pokemon
if Pokemon.all.count < 100
  (1..100).each do |i|
    p = Pokemon.new(name: PokeApi.get(pokemon: i).name)
    p.define_values
    if p.valid? then p.save end
  end
end

# Create a few users
users = ["luke","matthew","joan-purdy","jared","sungwoo","bogdan","chris"]
users.each do |user|
  u = User.new(name: user)
  u.password = "password"
  u.password_confirmation = "password"
  if u.valid? then u.save end
end

# create some people
people = ["Barack Obama", "Donald Trump", "Julian Casablancas", "Ice T", "Kanye West", "Nikolai Fraiture", "Albert Hammond Jr.", "Fabrizio Moretti","Nick Valensi", "Christ Erlendson", "John Doe"]

Pixabay.configure {|config| config.key = "28500566-e5988cf43e390d3c5949dac21"}
client = Pixabay.new
people.each do |person|
    p = Person.new(name: person)
    result = client.photos(q: p.name, safesearch: true, page: 1, per_page: 20)["hits"].first
    if !result.nil?
        p.img_url= result["webformatURL"]
    else
        p.img_url= "icon.svg"
    end
    p.save
end

# post & comment examples
post_content_examples = ["These two are a perfect match", "Amazed I'm the first person to post this one here", "Check this out. No way anyone can disagree with this.", "This match came to me in a dream.", "There is an uncanny resemblance in their <insert body part here>", "You might have to think about this one for it to make sense."]
positive_comments = ["lmao", "So true bestie", "as good as it gets. I love this website", "This comparison is almost as good as this site's CSS", "Alright, I'll give it to you. Solid comparison.", "Such a dumb pokemon and an even dumber person", "sick", "You haven't missed yet", "goddamn", "unironically hilarious", "[quirky comment]", "hahaha", "hmm... very perceptive", "lol", ":)", "preach", "This is it. This is the one.", "no capppp"]
negative_comments = ["don't know about this one", "go back to the drawing board chief", "oh my god. shut UP", "We all miss sometimes, no need to feel bad about yourself", "log off", "touch grass, for your own sake", "I would curse out whoever posted this but I know this site has no moderation and I don't want the developers to have to implement it", "Bait", "not a good look"]

# create posts
50.times do
    Post.create(person: Person.all.sample, user: User.all.sample, pokemon: Pokemon.all.sample, content: post_content_examples.sample)
end

vote_arr = [true, true, true, false, false]

# create comments (biased towards positive comments)
100.times do
    v = vote_arr.sample
    v ? c = positive_comments.sample : c = negative_comments.sample
    Comment.create(post: Post.all.sample, user: User.all.sample, vote: v, content: c)
end