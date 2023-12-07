Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  delete 'destroy_account', to: 'registrations#destroy', as: :destroy_account
  root "home#index"
  resources :daily_weights, except: [:show]
end