Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :cities
  resources :users
  resources :votes

  root 'static_pages#home'

  post 'cities/downvote', to: 'votes#create'
  post 'cities/upvote', to: 'votes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
