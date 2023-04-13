Rails.application.routes.draw do
  resources :users
  # root 'home#index'

  # get("/", controller: :home, action: :index)

  # Options ----------------
  # :path
  # :controller
  # :action
  # :param
  # :module
  # :as
  # :via
  # :to
  # :on
  # :constraints
  # :defaults
  # :format


  match 'photos/:id' => 'home#show', via: :get
  match 'photos/:id', to: 'home#show', via: :post
  match 'photos/:id', controller: 'home', action: 'index', via: :delete

  match 'one', to: "home#index", via: :get
                                # via: [:get, :post]
                                # via: :all

  match 'two/(:id)', controller: :home, action: :index, via: :all
  # match("/test:(id)", to: "home#index", via: :get)
  # match "home/:id", module: :Company


end
