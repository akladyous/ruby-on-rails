Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  resources :posts do
    resources :comments, module: :posts
  end
  root "posts#index"
end
