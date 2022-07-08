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
783.times do
    new_poke = Pokemon.new(name: PokeApi.get(pokemon: x).name)
    new_poke.define_values
    if new_poke.valid?
        new_poke.save
    end
    x+=1
end

# User.create(name: 'Malcolm') (make in site so that we can have passwords)
# User.create(name: 'Luke')

luke = User.find_by(name: 'Luke')
ash = User.find_by(name: 'Ash')
misty = User.find_by(name: 'Misty')
brock = User.find_by(name: 'Brock')

Person.create(name: 'Barack Obama')
Person.create(name: 'Donald Trump')
Person.create(name: 'Julian Casablanca')
Person.create(name: 'Kanye West')
Person.create(name: 'Nikolai Fraiture')
Person.create(name: 'Albert Hammond Jr.')
Person.create(name: 'Fabrizio Moretti')
Person.create(name: 'Nick Valensi')
Person.create(name: 'Chris Erlendson')
Person.create(name: 'Bernie Sanders')
Person.create(name: '')


one = Post.create(person: Person.find_by(name: 'Donald Trump'), pokemon: Pokemon.find_by(name: 'growlithe'), content: "He's orange lol. Popular politics is just aesthetics anyway, right. No point in trying to be deep.")
Comment.create(post: one, user: ash, vote: true, content: "Orange man bad.")
Comment.create(post: one, user: luke, vote: false, content: "See this is the problem with the American left. We replaced ideology with vibes and organizing with tweeting. We're the frog in the pot and don't even realize the water has been boiling since Reagan.")
Comment.create(post: one, user: brock, vote: true, content: "Haha. Came here to post this, glad someone already has.")
Comment.create(post: one, user: misty, vote: true, content: 'solid post.')

# create a ton of people
#  associate them randomly with pokemon in posts
# create a certain number of positive comments, choose between a bunch of positive messages, same with negative

post_content_examples = ["These two are a perfect match", "Amazed I'm the first person to post this one here", "Check this out. No way anyone can disagree with this."]
positive_comments = ["lmao", "So true bestie", "as good as it gets. I love this website", "This comparison is almost as good as this site's CSS", "Alright, I'll give it to you. Solid comparison.", "Such a dumb pokemon and an even dumber person", "sick", "You haven't missed yet", "goddamn", "unironically hilarious", "[quirky comment]", "hahaha", "hmm... very perceptive", "lol"]
negative_comments = ["don't know about this one", "go back to the drawing board chief", "oh my god. shut UP", "We all miss sometimes, no need to feel bad about yourself", "log off", "delete your account", "touch grass, for your own sake", "this sucks", "I would curse out whoever posted this but I know this site has no moderation and I don't want the developers to have to implement it"]

25.times do
    Post.create(person: Person.all.sample, pokemon: Pokemon.all.sample, content: post_content_examples.sample)
end

100.times do 
    Comment.create(post: Post.all.sample, user: User.all.sample, vote: true, content: positive_comments.sample)
end

40.times do
    Comment.create(post: Post.all.sample, user: User.all.sample, vote: false, content: negative_comments.sample)
end