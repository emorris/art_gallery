Rails.application.routes.draw do
  devise_for :users
  namespace :admin do 
    root 'application#index'
    resources :users
  end
  root 'dashboard#index'
end
