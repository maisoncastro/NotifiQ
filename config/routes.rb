Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard/index'
  get 'dashboard/settings'
  get 'dashboard/analytics'

  resources :stores, only: [:new, :create, :update, :edit, :show] do
    resources :confirmations, only: [:new, :create, :show]
  end

  resources :confirmations, only: [:index]

  devise_for :customers, path: 'customers'
  devise_for :business_users, path: 'business_users'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
