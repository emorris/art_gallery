Rails.application.routes.draw do
  namespace :admin do
    concern :pictures do
      member do
        patch :upload_picture
      end
    end

    resources :users
    resources :pictures, only: [:destroy]
    resources :app_settings, only:[:index, :update]
    resources :news_posts
    resources :artists do
      concerns :pictures
    end
    resources :galleries do
      concerns :pictures
      resources :shows do
        concerns :pictures
      end   
    end

    root 'application#index'
  end
 
  devise_for :users
  
  resources :galleries, only: [:index, :show] do
    resources :shows, only: [:index, :show]
  end

  resources :artists, only: [:index, :show]
  resources :news_posts, only: [:index, :show]
  resources :app_settings, only:[:index]
  post "/contact_form", to: 'contact#index'
  root 'dashboard#index'
end
