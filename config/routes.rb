Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :pokemons
  resources :people

  get "/posts/:id/comments/new", to: "comments#new"
  get "/posts/:id/comments/:comment_id/edit", to: "comments#edit"

  get "/", to: "posts#index"

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
