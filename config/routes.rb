Rails.application.routes.draw do
  get "users/:id", to: "users#show"
  get "users/all", to: "users#index"
  post 'users/create', to: "users#create"
  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"
  
  resources :messages
  resources :photos
end
