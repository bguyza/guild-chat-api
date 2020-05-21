Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chats
  resources :messages do
    collection do
      get :recent_for_user
      get :recent_all
    end
  end
  resources :users do
    resources :user_chats
  end

end
