# PeopleToPokemon

PeopleToPokémon is a simple Ruby-on-Rails app that lets users create comparisons between people and Pokémon.

## Running the application
*This app requires Ruby version: ~> 2.7.3*

1. Clone or download the repository to your computer
2. Run `bundle install` to install this project's dependencies
3. Create & seed the database (this takes a little bit)
```bash
bin/rails db:migrate
bin/rails db:seed
```
4. Run the application with `rails s`

## About the app
* Built on Ruby 2.7 and Rails 7.0
* Manages a SQLite3 database for data persistence
* Uses the [Bulma.io](https://bulma.io/) CSS framework for the front-end
* Pulls Pokémon info from the [PokéAPI](https://pokeapi.co/docs/v2) database, using the [Poke-Api-V2](https://github.com/rdavid1099/poke-api-v2) gem
* Pulls people images from [Pixabay](https://pixabay.com/) using the [pixabay-api](https://github.com/kimsuelim/pixabay) gem
---
<div align="center">By: <a href="https://github.com/lukebaltaycs">Luke Baltay</a> and <a href="https://github.com/malcolmk181">Malcolm Keyes</a></div>
