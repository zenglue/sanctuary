Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :cities
  resources :users

  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
