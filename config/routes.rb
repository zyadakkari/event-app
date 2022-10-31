Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :create]


  root 'events#index'

  resources :events, :only => [:index, :new, :create]
end
