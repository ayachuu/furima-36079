Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :purchase_records, only: [:create] do
    resources :retailers, only: :index
  end
end
