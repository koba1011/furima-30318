Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :show, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    collection do
      get 'favorites'
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update]
end
