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
match "test",       to: "test#index", via: :get
match "test",       to: "test#index", via: :delete, param: :test_id
match 'test/:id'    =>  'test#show', via: :get, as: "get_photos"
match 'test/:id',   to: 'test#show', via: :post
match 'test/:id',   to: 'test#show', via: :patch
match 'test/:id',   controller: 'photos', action: 'index', via: :all
match 'test/:id',   to: 'test#update', constraints: {format: 'json'}, via: :get
match 'test/:id',   to: 'test#delete', constraints: {id: /[A-Z]\d{3}/}, via: :get
match 'test',       to: 'test#index', defaults: {format: 'jpg'}, via: :get
