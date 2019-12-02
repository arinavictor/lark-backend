Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show]
  post "login", to: "authentication#login"
  get "profile", to: "users#profile"
end
