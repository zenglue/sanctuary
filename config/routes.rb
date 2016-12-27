Rails.application.routes.draw do
  devise_for :users

  resources :cities do
    resources :votes do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  resources :cities

  resources :votes do
    resources :comments
  end


  resources :users do
    member do
      get 'make-admin'
      post 'make-admin'
    end
  end

  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
