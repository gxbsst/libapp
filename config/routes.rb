Libapp::Application.routes.draw do
  get '/register', to: "readers#new", as: "register"
  resources :readers
  root to: 'home#index'
  get '/login', to: "sessions#new", as: 'sessions'
end
