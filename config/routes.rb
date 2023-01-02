Rails.application.routes.draw do
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#home"
  # get "/restaurants", to: "restaurants#index"
  # get "/restaurants/new", to: "restaurants#new"
  # post "/restaurants", to: "restaurants#create"
  # get "/restaurants/:id", to: "restaurants#show", as: :restaurant
  # get "/restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # patch "/restaurants/:id", to: "restaurants#update"
  # delete "/restaurants/:id", to: "restaurants#destroy"
  resources :restaurants do
    resources :reviews, only: %i[new create]
    collection do
      get :top
      get :random
      # get "/restaurants/top", to: :restaurants#top", as: :top_restaurants
    end
    member do
      get :chef
    end
  end
  resources :reviews, only: [:destroy]
end
