Rails.application.routes.draw do

  post 'post/new' => 'post/new#create'


  resources :admins, only: [:index]


  resources :post, only: [:new, :create]


  resources :game_event, only: [:index, :new, :edit, :show, :create, :update]


  resources :enduser, only: [:index, :show, :edit, :update] do
    member do
      get 'dm'
    end
  end
end

