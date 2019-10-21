Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  root to: 'home#index'

  devise_for :endusers
  devise_for :admins


  resources :admin, only: [:index, :destroy]


  resources :post, only: [:new, :show, :create, :destroy] do
    resource :post_comments, only: [:create]
  end

  resources :dm_messages, only: [:create]

  resources :dm_rooms, only: [:show, :create]


  resources :enduser, only: [:index, :show, :edit, :update, :destroy ] do
    member do
      get 'dm'
    end
  end
end

