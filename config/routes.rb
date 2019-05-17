Rails.application.routes.draw do
  get "users/all", to: "users#index"
  post 'users/create', to: "users#create"
  get "users/:id", to: "users#show"
  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  post "/photos", to: "photos#create"
  delete "/photos/:id", to: "photos#destroy"
  
  resources :messages
  resources :photos
end
