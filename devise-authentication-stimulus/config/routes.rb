Rails.application.routes.draw do
    # devise_for :users
    root 'home#index'
    
    devise_for :users, controllers: {
        sessions: 'users/sessions'
    }
end
