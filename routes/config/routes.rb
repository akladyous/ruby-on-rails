Rails.application.routes.draw do
  # root 'home#index'
  get("/", controller: :home, action: :index)

  match("/test:id", to: "home#index", via: :get)
end
