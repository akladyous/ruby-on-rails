Rails.application.routes.draw do
  
    namespace :api do
        resources :todos
    end
    resources :utentis
    
    resources :categories do
        member do
            get 'preview'
        end
        collection do
            post 'nuovo', :action => :prova
            get "prova"
        end
        # get 'exit', to: "categories#destroy"
        # get "test1", controller: :categories, action: :show
    end
    # ,format: false,
    # except: [:edit, :new]
    # :default => {:format => 'json'}
    
    # categories GET    /categories(.:format)     categories#index
    # POST   /categories(.:format)     categories#create
    # category GET    /categories/:id(.:format) categories#show
    # PATCH  /categories/:id(.:format) categories#update
    # PUT    /categories/:id(.:format) categories#update
    # DELETE /categories/:id(.:format) categories#destroy

    # get 'categories/index'
    # get "categoriez", to: "categories#index"
    # get "categoriez/:id", to: "categories#show"
    # get "categoriez", controller: :categories, action: :show
    # patch "categoriez/:id", to: "categories#update"
    # post "categoriez", to: "categories#create"
    # delete "categoriez/:id", to: "categories#destroy"

    # get :categories, controller: :categories, action: :show, :constrains => {format: :json}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

=begin
path(route) http verb   controller - action
someroute   get         

get - index /categories/
get - show /categories/:id
put - update /categories/:id
patch - update / categories/:id
post - create /categories
delete - destroy / categories/:id

get "categories", controller: :categories, action: index


=end