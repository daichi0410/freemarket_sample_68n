Rails.application.routes.draw do

  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

root to: "items#index"


  resources :items, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    collection do
      get 'category_children' 
      get 'category_grandchildren'
      get 'search'
      get 'items/fav/:id' => 'items#fav', as: "fav_items"
      get "users/:id/likes" => "users#likes"
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
    resources :comments, only: [:create]
  end
  resources :categories, only: [:index, :show, :new]


  resources :images, only: [:new, :create]
  resources :test, only: [:index, :create]
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
