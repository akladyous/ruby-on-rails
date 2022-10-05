Rails.application.routes.draw do
  resources :books
    get 'demo', to: 'demo#index'
    get 'demo/index'
    get 'demo/create'
    get 'demo/update'
    get 'demo/delete'
    
    root "prova#index"
    # get 'prova/index'
    # get 'prova', controller: :prova, action: 'index'
    get 'prova/(/:id)', to: 'prova#index'
    

    get 'welcome', to: "welcome#index"
end
