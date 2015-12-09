Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root 'application#index'
    resources :users
    resources :artists
    resources :galleries do
      resources :shows
    end
    resources :news_posts
  end
  root 'dashboard#index'
end
