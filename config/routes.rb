Rails.application.routes.draw do
  resources :books, only: [:index]
  resources :reviews, only: [:create, :update, :destroy]
  resources :users, only: [:index, :create, :update]
  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  get '/user_is_authed', to: 'auth#user_is_authed'
  get '/logout', to: 'users#logout'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
