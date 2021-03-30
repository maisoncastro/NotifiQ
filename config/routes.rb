Rails.application.routes.draw do

  # get 'stores/qrcode'
  # get 'stores/update'
  # get 'stores/:id/edit', to: 'stores#edit'
  # get 'stores/:id/show', to: 'stores#show'
  # get 'stores/new'
  # post 'stores/create'
  resources :stores, only: [:new, :create, :show, :update, :edit]
  resources :confirmations, only: [:new, :create, :show, :index]
  root to: 'pages#home'
  get 'dashboard/index'
  # get 'confirmations/new'
  # post 'confirmations/create'
  # get 'confirmations/show'
  # get 'confirmations/index'
  devise_for :customers, path: 'customers'
  devise_for :business_users, path: 'business_users'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
