Rails.application.routes.draw do
  devise_for :users
  root to: "itemes#index"
  resources :itemes, only: [:index, :new]
end
