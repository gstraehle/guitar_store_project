Rails.application.routes.draw do
  root 'products#index'
  resources :orders do
    resources :charges
  end

  devise_for :users

  resources :products
end
