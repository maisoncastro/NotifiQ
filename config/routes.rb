Rails.application.routes.draw do
<<<<<<< HEAD

  # get 'stores/qrcode'
  # get 'stores/update'
  # get 'stores/:id/edit', to: 'stores#edit'
  # get 'stores/:id/show', to: 'stores#show'
  # get 'stores/new'
  # post 'stores/create'
  resources :stores, only: [:index, :new, :create, :update, :edit, :show]
  resources :confirmations, only: [:new, :create, :show, :index]
=======
>>>>>>> 3fcce44c31c85bed7d708011d47bf00bd04e9c88
  root to: 'pages#home'
  get 'dashboard/index'

  resources :stores, only: [:new, :create, :update, :edit, :show] do
    resources :confirmations, only: [:new, :create, :show, :index]
  end

  devise_for :customers, path: 'customers'
  devise_for :business_users, path: 'business_users'

<<<<<<< HEAD

=======
>>>>>>> 3fcce44c31c85bed7d708011d47bf00bd04e9c88
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
