Rails.application.routes.draw do

    resources :users, only: [:create] do
        collection do
            get :profile, to: "users#show"
            post :login, to: "sessions#create"
            delete :logout, to: "sessions#destroy"
        end
    end
    post :mailer, to: "users#email"
end
