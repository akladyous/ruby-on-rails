Rails.application.routes.draw do
  resources :blogs
  resources :posts
  root "posts#index"
end
