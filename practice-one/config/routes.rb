Rails.application.routes.draw do

  resources :posts do
    resource :likes, only: [:show, :create, :destroy]
  end
  resources :users
  resources :products
  resources :people
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
