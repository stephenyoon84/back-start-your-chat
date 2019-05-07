Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :rooms
      resources :room_messages
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'

      mount ActionCable.server => '/cable'
    end
  end
end
