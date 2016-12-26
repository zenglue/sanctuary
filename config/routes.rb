Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :cities do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :users do
    member do
      get 'make_admin'
      post 'make_admin'
    end
  end

  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
