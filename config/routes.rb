Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "items#index"
  resources :mypage, only: [:index, :destroy]
  resources :items, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :images, only: [:new, :create]
  resources :test, only: [:index, :create]
end
