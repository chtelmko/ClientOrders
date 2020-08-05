Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :customers do
    resources :orders
  end
  
  resources :orders do
      resources :order_items
  end
  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
