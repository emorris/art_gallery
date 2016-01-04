Rails.application.routes.draw do
  devise_for :users

  resources :galleries, only: [:index, :show] do
    resources :shows, only: [:index, :show]
  end
  resources :artists, only: [:index, :show]
  resources :news_posts, only: [:index, :show]

  namespace :admin do
    
    resources :users
    resources :pictures, only: [:destroy]

    resources :artists do
      member do
        patch :upload_picture
      end
    end

    resources :galleries do
      member do
        patch :upload_picture
      end

      resources :shows do
        member do
          patch :upload_picture
        end
      end   
    end
    resources :news_posts
    root 'application#index'
  end

  root 'dashboard#index'
end
