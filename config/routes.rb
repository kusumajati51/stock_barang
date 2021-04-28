# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      post '/register', to: 'register#create'
      post '/login', to: 'login#create'

      get '/item/index', to: 'item#index'
      get 'item/show/:id', to: 'item#show'
      post '/product/baru', to: 'item#create'

      get '/category/index/spinner', to: 'category#spinner_category'
      get '/category/show/all', to: 'category#show_all_category'
      # get '/category/index/all', to: 'category#liston'
      get '/category/list', to: 'category#index'
      post '/category/baru', to: 'category#create'
      
      
      get '/order/list', to: 'order#index'
      post '/order/baru', to: 'order#create'
      post '/order/multi', to: 'order#multi_order'

      post '/create/variant', to: 'inventory#create_variant_name'
      get '/variant/:id', to: 'inventory#get_data_variant'
     
      patch '/update/inventory', to: 'inventory#update_inventory'


      post '/create/brand', to: 'brand#create_brand'
      post '/multi/create/brand', to: 'brand#multi_create_brand'
      get '/brand/index', to: 'brand#index'

      get '/dashboard/order/list', to: 'dashboard#show_dashboard_order_list'
      get '/dashboard/order/item', to: 'dashboard#show_dashboard_order_sell'
      get '/dashboard/order/transaction', to: 'dashboard#show_dashboard_show_transaction'


    end
  end

  get "login" => "sessions#new", :as => "login"
  get "menu" => "menu#index"
  root :to => "sessions#new"
  # resource :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
