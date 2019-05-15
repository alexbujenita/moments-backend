Rails.application.routes.draw do
  post 'users/create', to: "users#create"
  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"
  
  resources :messages
  resources :photos
end
