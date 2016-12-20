Rails.application.routes.draw do
  resources :comments
  resources :cities
  resources :users

  root 'application#home', as: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
