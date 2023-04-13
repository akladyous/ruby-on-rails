Rails.application.routes.draw do
  # get 'home/index'
  root to: "home#index"

  devise_for :users
    get 'users/index'
    get 'users/utente'

    # resources :users


    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
