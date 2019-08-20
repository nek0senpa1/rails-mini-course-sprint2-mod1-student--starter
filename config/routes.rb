Rails.application.routes.draw do
  resources :order_products
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :products, only: [:index, :show]
    end
  end
end
