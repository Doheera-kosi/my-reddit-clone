# Rails.application.routes.draw do
#   get '/users/sign_in', to: 'users/sessions#new'
#   resources :links do
#     member do
#       put "like", to: "links#upvote"
#       put "dislike", to: "links#downvote"
#     end
#     resources :comments, only: [:create]
#   end
#   devise_for :users, controllers: { sessions: 'users/sessions' }
#   resources :comments
#   resources :users, only: [:new, :create]
#   root to: 'links#index'
# end

Rails.application.routes.draw do
  namespace :users do
    get '/sign_in', to: 'sessions#new'
    resources :sessions, only: [:create]
  end

  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments, only: [:create]
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :comments

  namespace :users do
    resources :users, only: [:new, :create]
  end

  root to: 'links#index'
end
