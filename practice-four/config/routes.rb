Rails.application.routes.draw do
  resources :posts do
    resources :comments, module: :posts
  end
  root "posts#index"
end
