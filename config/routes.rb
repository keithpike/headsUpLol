Rails.application.routes.draw do
  # get 'splash', to: 'static#frontpage'
  root to: 'sessions#new'
  get 'users/dashboard'
  resources :blogs do
    resources :posts, except: [:index] do
    end
  end
  resources :posts, only: [:index]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resource :text_post, only: [:new]
  resource :photo_post, only: [:new]
  resource :qyote_post, only: [:new]
  resource :link_post, only: [:new]
  resource :chat_post, only: [:new]
  resource :audio_post, only: [:new]
  resource :video_post, only: [:new]
end
