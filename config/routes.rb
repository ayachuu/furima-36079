Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  get "/products", to: "products#index"
end
