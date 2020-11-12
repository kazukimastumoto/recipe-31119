Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
