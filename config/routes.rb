Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :cities do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  # post '/cities/:city_id/votes/upvote', to: 'votes#upvote', as: 'upvote_city_vote'
  # post '/cities/:city_id/votes/upvote', to: 'votes#downvote', as: 'downvote_city_vote'

  resources :votes do
    resources :comments
  end

  resources :users, only: [:index, :show] do
    member do
      get 'make-admin'
      post 'make-admin'
    end
  end

  get 'about', to: 'application#about', as: 'about'

  root 'cities#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
