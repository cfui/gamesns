Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  devise_for :endusers
  devise_for :admins


  resources :admin, only: [:index]


  resources :post, only: [:new, :show, :create] do
    resource :post_comments, only: [:create]
  end

  resources :dm_messages, only: [:create]

  resources :dm_rooms, only: [:show, :create]

  resources :game_event, only: [:index, :new, :edit, :show, :create, :update]


  resources :enduser, only: [:index, :show, :edit, :update] do
    member do
      get 'dm'
    end
  end
end

