Rails.application.routes.draw do
  resources :posts
  resources :friendships, only: %i[create destroy]
  root 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
