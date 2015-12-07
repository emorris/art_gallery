Rails.application.routes.draw do
  devise_for :users
  namespace :admin do 
    root 'application#index'
    resources :users
    resources :galleries
  end
  root 'dashboard#index'
end
