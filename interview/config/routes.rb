Rails.application.routes.draw do
    root 'posts#index'
    devise_for :users
    resources :posts
    match "contact", to: "contact#index", via: :get
    match "contact", to: "contact#create", via: :post
end
