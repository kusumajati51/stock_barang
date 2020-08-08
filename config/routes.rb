# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      post '/register', to: 'register#create'
      post '/login', to: 'login#create'

      get '/item/index', to: 'item#index'
      get '/category/index/menu', to: 'item#index'
      get 'item/show/:id', to: 'item#show'

      get '/category/index/spinner', to: 'category#spinner_category'
      get 'category/index/all', to: 'category#liston'
      get '/category/list', to: 'category#index'
      get '/order/list', to: 'order#index'

      post '/product/baru', to: 'item#create'
      post '/category/baru', to: 'category#create'
      post '/order/baru', to: 'order#create'
      post '/order/multi', to: 'order#multi_order'

      post '/create/variant', to: 'inventory#create_variant_name'
      post '/create/inventory', to: 'inventory#create_inventory'

    end
  end

  get "login" => "sessions#new", :as => "login"
  get "menu" => "menu#index"
  root :to => "sessions#new"
  resource :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
