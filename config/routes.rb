Rails.application.routes.draw do
  root to: "items#index"
  get '/users/sign_out' => 'devise/sessions#destroy'
  devise_for :users
  resources :items, only: [:index]
end
