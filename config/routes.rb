Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]


  root 'events#index'

  resources :events, :only => [:show, :index, :new, :create]
end
