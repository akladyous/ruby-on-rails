Rails.application.routes.draw do
  root 'home#index'
  # draw(:singular_routes) -- including all routes defined in config/routes/singular_routes.rb
  # get("/", controller: :home, action: :index)


  # get 'students/:id', to: 'students#show', as: 'grades'
  # get "students/:id", controller: :students, action: 'show'

  # ActionDispatch::Routing::Mapper::Base
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
  match 'test',       to: 'test#index', via: :get
  match 'test',       to: 'test#index', via: :delete, param: :test_id
  match 'test/:id' => 'test#show', via: :get, as: 'get_photos'
  match 'test/:id',   to: 'test#show', via: :post
  match 'test/:id',   to: 'test#show', via: :patch
  match 'test/:id',   controller: 'photos', action: 'index', via: :all
  match 'test/:id',   to: 'test#update', constraints: { format: 'json' }, via: :get
  match 'test/:id',   to: 'test#delete', constraints: { id: /[A-Z]\d{3}/ }, via: :get
  match 'test',       to: 'test#index', defaults: { format: 'jpg' }, via: :get
  get   '/test/:name', to: redirect('/articles/%<name>s', status: 302)
  post  'test/:id', to: -> {}

  # RESOURCES < ----------------------------------------
  # Options : Takes same options as 'match' as well as:
  # :path_name
  # :path -> to be applied on 'resources'
  # :only
  # :except
  # :shallow
  # :shallow_path
  # :format
  # :param
  #

  # get "students/:id", to: "students#show", constraints: {id: /\d{1,2}/}
  # constraints(id: /\d{1,3}/) do
  resources :students, path: 'studenti', path_names: { update: 'student_path' } do
    member do
      patch :publish
    end
    collection do
      delete :publish_all
    end
  end
  # end

  resources :users, shallow: true do
    resources :photos, param: :photo_id, path: 'images'
  end

  resources :animals, shallow: true do
    resources :dogs
  end

  resources :posts, path: 'posting' do
    member do
      get 'member'
      post 'member'
    end
    collection do
      post 'search'
      delete 'delete'
    end
  end

  namespace 'admin', module: 'prova' do
    resources :books
  end

  scope module: 'blog' do
    resources :posts
  end
end
