Rails.application.routes.draw do

  devise_for :endusers


  resources :admins, only: [:index]


  resources :post, only: [:new, :create] do
    resource :post_comments, only: [:create]
  end


  resources :game_event, only: [:index, :new, :edit, :show, :create, :update]


  resources :enduser, only: [:index, :show, :edit, :update] do
    member do
      get 'dm'
    end
  end



  
end

