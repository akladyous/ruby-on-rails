Rails.application.routes.draw do
  
  resources :mobiles
  resources :computers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :users

    get 'feedback', to:'feedback#index'
    post 'feedback', to:'feedback#create'
end
