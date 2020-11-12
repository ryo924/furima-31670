Rails.application.routes.draw do
  get 'order/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
