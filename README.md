# PeopleToPokemon

PeopleToPokémon is a simple Ruby-on-Rails app that lets users create comparisons between people and Pokémon.

## Installation
*This app requires Ruby version: ~> 2.7.3*

1. Clone or download the repository to your computer
2. Run `bundle install` to install this project's dependencies
3. Create & seed the database (this takes a little bit)
```bash
bin/rails db:migrate
bin/rails db:seed
```
4. Run the application with `rails s`

## Usage
- Users can view pokémon, people, and people-pokémon matches
- Users can add new pokémon and people, and create matches (posts) & comments on posts. Users can delete their own posts
- Users can sign up & login/logout

![image](https://user-images.githubusercontent.com/78397791/178868900-03844b17-8e69-490a-967b-77e735b85d58.png)
*The home page*

![image](https://user-images.githubusercontent.com/78397791/178869016-59aa618d-00ce-4013-beab-8e109594430c.png)
*The people page*

![image](https://user-images.githubusercontent.com/78397791/178869087-97c9ba31-cb20-4a8d-80ee-0c12b64c4a2b.png)
*The pokémon page*

![image](https://user-images.githubusercontent.com/78397791/178869132-730fdbda-4b53-4139-84cc-78e6d82a6183.png)
*The posts page*

![image](https://user-images.githubusercontent.com/78397791/178869316-627fc6f2-fe6f-493f-94af-8e03c3d9f171.png)
*An individual post with comments*

![image](https://user-images.githubusercontent.com/78397791/178869790-3c684d09-582a-4cdc-a9c8-c3a3278be0d7.png)
*An individual pokémon*

![image](https://user-images.githubusercontent.com/78397791/178870264-917f816e-bafe-4980-ab94-1ce4f6344993.png)
*An individual person*

## About the app
* Built on Ruby 2.7 and Rails 7.0
* Manages a SQLite3 database for data persistence
* Uses the [Bulma.io](https://bulma.io/) CSS framework for the front-end
* Pulls Pokémon info from the [PokéAPI](https://pokeapi.co/docs/v2) database, using the [Poke-Api-V2](https://github.com/rdavid1099/poke-api-v2) gem
* Pulls people images from [Pixabay](https://pixabay.com/) using the [pixabay-api](https://github.com/kimsuelim/pixabay) gem
---
<div align="center">By: <a href="https://github.com/lukebaltaycs">Luke Baltay</a> and <a href="https://github.com/malcolmk181">Malcolm Keyes</a></div>
