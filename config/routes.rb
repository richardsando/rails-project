Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'pages#home'
  get '/profiles/:id/createcart' => 'profiles#createcart'
  get '/profiles/:id/showcart' => 'profiles#showcart'


  get '/tshirts' => 'pages#tshirts'

  get '/iphonecases' => 'pages#iphonecases'

  get '/stickers' => 'pages#stickers'
  
  get '/prints' => 'pages#prints'

  get '/fandoms' => 'pages#fandoms'

  resources :charges
  get 'profiles/:id/become_artist' => 'profiles#become_an_artist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
