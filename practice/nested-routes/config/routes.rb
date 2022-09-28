Rails.application.routes.draw do
    root 'main#index'
    # devise_for :users
    namespace :api do
        devise_for :users, controllers: {
            sessions: 'api/users/sessions',
            passwords: 'api/users/passwords',
            registrations: 'api/users/registrations'
        }
    end
end
