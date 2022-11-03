Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root 'events#index'

  resources :events do
      member do
        get 'rsvp'
        get 'cancel_rsvp'
      end
  end
  resources :users
end
