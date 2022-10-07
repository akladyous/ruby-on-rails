Rails.application.routes.draw do
  get 'contact/index'
  get 'contact/create'
    root 'posts#index'
    devise_for :users
    resources :posts
    match "contact", to: "contact#index", via: :get
    match "contact", to: "contact#create", via: :post
end
