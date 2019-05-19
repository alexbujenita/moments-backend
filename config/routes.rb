Rails.application.routes.draw do
  get "users/all", to: "users#index"
  post 'users/create', to: "users#create"
  get "users/:id", to: "users#show"
  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  post "/photos", to: "photos#create"
  delete "/photos/:id", to: "photos#destroy"

  post "/messages", to: "messages#create"
  get "/messages/:id", to: "messages#seen"
  
  resources :messages
  resources :photos
end
