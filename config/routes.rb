Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root 'application#index'
    resources :users
    resources :pictures, only: [:destroy]
    resources :artists
    resources :galleries do
      member do
        patch :upload_picture
      end
      resources :shows
    end
    resources :news_posts
  end
  root 'dashboard#index'
end
