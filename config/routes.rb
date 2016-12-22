Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :cities do
    member do
      post 'upvote'
      post 'downvote'
    end
    # resources :upvotes

    # resources :votes, only: [:create, :destroy]
    # get 'votes', to: "votes#new"
  end

  resources :users

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
