Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :cities do
    resources :upvotes
    resources :downvotes
  end

  resources :users

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
