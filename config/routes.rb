Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :pokemons
  resources :people

  get "/posts/:id/comments/new", to: "comments#new"
  get "/posts/:id/comments/:comment_id/edit", to: "comments#edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
