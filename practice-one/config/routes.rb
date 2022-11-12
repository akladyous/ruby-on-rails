Rails.application.routes.draw do
  get 'errors/show'

  resources :posts do
    resource :likes, only: [:show, :create, :destroy]
  end
  resources :users
  resources :products
  resources :people

  resources :infos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  # match '404', to: redirect('/'), via: :all
  match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}, via: :all
end

