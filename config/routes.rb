Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get '/users/sign_out' => 'devise/sessions#destroy'
  resources :items
  resources :orders
end
