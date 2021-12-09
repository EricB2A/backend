Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tags
      post '/notes/tag', to: 'notes#addtag'
      resources :notes, only: [:show, :create, :update, :destroy]
      resources :test, only: [:index]
      resources :folders, only: [:create, :update, :destroy]
      get '/folders/:user_id', to: 'folders#get'

      get '/structure/:user_id', to: 'notes#structure'

      post '/login', to: 'authentications#login'
      post '/signup', to: 'authentications#signup'
    end
  end
end