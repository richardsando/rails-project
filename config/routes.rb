Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'pages#home'
  get 'profiles/:id/cart' => 'profiles#cart'

  get '/tshirts' => 'pages#tshirts'

  get '/iphonecases' => 'pages#iphonecases'

  get '/stickers' => 'pages#stickers'
  
  get '/prints' => 'pages#prints'

  get '/fandoms' => 'pages#fandoms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
