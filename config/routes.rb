Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :daily_weights do

  end
end
