Rails.application.routes.draw do
  root 'events#index'


  get 'rooms/show'

  get 'activities/index'
  get 'feed/index'

  get 'users/show'



  resources :events
  resources :feed
  resources :matches
  post "assign" => "matches#assign"
  devise_for :users
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
