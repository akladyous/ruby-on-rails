Rails.application.routes.draw do
  root 'home#index'
  draw(:singular_routes)

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


  # get "students/:id", to: "students#show", constraints: {id: /\d{1,2}/}
  # constraints(id: /\d{1,3}/) do
    resources :students, path: 'studenti', path_names: {update: 'student_path'} do
      member do
        patch :publish
      end
      collection do
        delete :publish_all
      end
    end
  # end

  resources :users, shallow: true  do
        resources :photos, param: :photo_id, path: 'images'
  end

  resources :squares do
    member do
      get 'member'
      post 'member'
    end
    collection do
      post 'search'
      delete 'delete'
    end
  end

  namespace "admin", module: 'prova' do
    resources :books
  end

  scope  module: 'blog' do
    resources :posts
  end
end




