Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'pages#home'
  get '/profiles/:id/addtocart' => 'profiles#add_to_cart' #working on this one

  get '/profiles/:id/showcart' => 'profiles#showcart'
  get '/profiles/:id/showcart/remove-item' => 'profiles#remove_cart_item'
  get '/profiles/:id/checkout_cart' => 'profiles#checkout_cart'
  get '/profiles/:id/previous_orders' => 'profiles#previous_orders'

  #wishlist stuff
  get '/profiles/:id/addtowishlist' => 'profiles#add_to_wishlist'
  get '/profiles/:id/show-wishlist' => 'profiles#show_wishlist'
  get '/profiles/:id/show-wishlist/remove-item' => 'profiles#remove_wishlist_item'
  get '/profiles/:id/show-wishlist/remove-item-on-wishlist' => 'profiles#remove_item_on_wishlist_page'

  # categories and fandoms
  get '/tshirts' => 'pages#tshirts'
  get '/iphonecases' => 'pages#iphonecases'
  get '/stickers' => 'pages#stickers'
  get '/prints' => 'pages#prints'
  get '/fandoms' => 'pages#fandoms'

  resources :charges
  get 'profiles/:id/become_artist' => 'profiles#become_an_artist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
