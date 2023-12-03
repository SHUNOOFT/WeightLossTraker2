Rails.application.routes.draw do
  devise_for :users
  delete 'destroy_account', to: 'application#destroy_account', as: :destroy_account
  root "home#index"
  resources :daily_weights do

  end
end
