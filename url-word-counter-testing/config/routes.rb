Rails.application.routes.draw do
  resources :posts do
    resources :stats, only: [:index]
  end

  root "posts#index"
end
