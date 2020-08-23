Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get '/users/sign_out' => 'devise/sessions#destroy'
  resources :items do
    resources :orders, only: [:new, :create]
    resources :messages, only: [:create]
  end
end
