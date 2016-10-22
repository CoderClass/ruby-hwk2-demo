Rails.application.routes.draw do
  resources :friendships
  resources :followings

  get 'messages/incoming'

  resources :messages do
    collection do
      get 'incoming'
      get 'sent'
    end

    member do
      post 'mark_as_read'
    end
  end
  resources :sessions, only: [:new, :create]

  delete 'logout' => 'sessions#destroy'
  resources :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
