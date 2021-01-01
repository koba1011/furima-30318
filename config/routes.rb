Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :profiles, only: [:new, :create]
end
