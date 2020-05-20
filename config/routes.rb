Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
 
  resources :messages
  # resources :user_chats
  resources :chats
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
