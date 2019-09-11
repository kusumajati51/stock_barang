Rails.application.routes.draw do
  namespace :api, default: {format: 'json'} do 
    namespace :v1 do
      post '/register', to:'register#create'
      post '/login', to:'login#create'
      get '/product/index', to:'product#index'
      get '/category/index', to:'category#index'
      post '/product/baru', to:'product#create'
      post '/category/baru', to:'category#create'
   end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
