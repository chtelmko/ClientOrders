Rails.application.routes.draw do
      get 'welcome/index'
      
      resources :customers do
        resources :orders
      end
      
      resources :orders do
          resources :order_items
      end
      
      post 'find', to: 'customers#find', as: :find
      
  
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    resources :users
    resources :sessions

    root 'welcome#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
