Rails.application.routes.draw do
    resources :photos, param: :photo_id
  resources :users
  # root 'home#index'

  # get("/", controller: :home, action: :index)

  # Options ----------------
  # :path
  # :controller
  # :action
  # :param
  # :path
  # :module
  # :as
  # :via
  # :to
  # :on
  # :constraints
  # :defaults
  # :format

  # match(path, options = nil) ⇒ Object
  # :via
  match "test",     to: "test#index", via: :get
  # :as
  match 'test/:id'  =>  'test#show', via: :get, as: "get_photos"
  match 'test/:id', to: 'test#show', via: :post
  # :controller, :action
  match 'test/:id', controller: 'photos', action: 'index', via: :all
  match 'two/(:id)', controller: :home, action: :index, via: :all

  # :constraints
    match 'test/:id', to: 'test#update', constraints: {format: 'json'}, via: :get
    match 'test/:id', to: 'test#delete', constraints: {id: /[A-Z]\d{3}/}, via: :get
  # :defaults
    match 'test', to: 'test#index', defaults: {format: 'jpg'}, via: :get

end
