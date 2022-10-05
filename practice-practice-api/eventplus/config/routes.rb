Rails.application.routes.draw do
    resources :event_location_types
    resources :event_tags
    resources :event_categories
    resources :event_types
    resources :events
    resources :user_addresses
    # resources :user_profiles
    # resources :users

    # resource :session, only: [:new, :create,:destory]

    scope :api do
        resources :users do
            # resources :user_profiles, shallow: true
            resources :user_profiles, only: [:index, :new, :create]
        end
    end

    draw(:session)
end


    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"