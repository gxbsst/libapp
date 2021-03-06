Libapp::Application.routes.draw do
  get '/register', to: "readers#new", as: "register"
  resources :readers
  root to: 'home#index'
  get '/login', to: "sessions#new", as: 'sessions'
  get '/logout', to: "sessions#destroy", as: 'logout'
  post '/login', to: "sessions#create"
end
