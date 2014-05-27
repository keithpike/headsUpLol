Rails.application.routes.draw do
  # Correct this. Make things actually use controllers
  root to: 'sessions#new'
  mount Markitup::Rails::Engine, at: "markitup", as: "markitup"
  resources :blogs do
    resources :posts, except: [:index] do
    end
  end
  resources :posts, only: [:index]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resource :dashboard, only: [:show]
  resource :text_post, only: [:new]
  resource :photo_post, only: [:new]
  resource :quote_post, only: [:new]
  resource :link_post, only: [:new]
  resource :chat_post, only: [:new]
  resource :audio_post, only: [:new]
  resource :video_post, only: [:new]
end
