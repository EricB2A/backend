Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tags
      post '/notes/tag', to: 'notes#addtag'
      resources :notes, only: [:show, :create, :update, :destroy]
      resources :folders, only: [:create, :update, :destroy]
      get '/folders', to: 'folders#get'

      get '/structure', to: 'notes#structure'

      get 'notes/:id/shared_notes', to: 'notes#get_all_shared_notes_by_note'
      resources :notes

      post 'shared_notes/:uuid/copy', to: 'shared_notes#copy'
      resources :shared_notes, only: [:show, :create, :destroy]

      post '/signin', to: 'authentications#signin'

      post '/signup', to: 'authentications#signup'

      match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}

      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
    end
  end
end