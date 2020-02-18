Rails.application.routes.draw do
  resources :items, only: [:index, :new, :create, :show]
  resources :images, only: [:new, :create]
end
