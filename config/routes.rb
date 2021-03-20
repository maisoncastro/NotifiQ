Rails.application.routes.draw do
  
  get 'stores/qrcode'
  get 'stores/update'
  get 'stores/edit'
  get 'stores/show'
  root to: 'pages#home'
  get 'dashboard/index'
  get 'confirmations/new'
  get 'confirmations/show'
  get 'confirmations/index'
  devise_for :customers
  devise_for :business_users
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
