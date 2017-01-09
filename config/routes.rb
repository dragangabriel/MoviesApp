Rails.application.routes.draw do
  devise_for :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
end

  resources :movies do
 	resources :comments
  end

resources :actors
 
  root 'movies#index'
end
