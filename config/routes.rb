Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'recipes#index'
  resources :recipes do
    collection do
      get 'search'
    end
  end
  resources :notifications, only: :index
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
    collection do
      get :likes
    end
    member do
      get 'mypege'
    end
    get :follows, on: :member
    get :followers, on: :member
  end
end
