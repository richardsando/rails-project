Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'pages#home'
  get '/profiles/:id/addtocart' => 'profiles#add_to_cart'
  get '/profiles/:id/showcart' => 'profiles#showcart'
  get '/profiles/:id/checkout_cart' => 'profiles#checkout_cart'
  get '/profiles/:id/previous_orders' => 'profiles#previous_orders'

  #remove cart item
  get '/profiles/:id/showcart/remove-item' => 'profiles#remove_cart_item'

  #remove wishlist item
  get '/profiles/:id/show-wishlist/remove-item' => 'profiles#remove_wishlist_item'


  #wishlist stuff
  get '/profiles/:id/addtowishlist' => 'profiles#add_to_wishlist'
  get '/profiles/:id/show-wishlist' => 'profiles#show_wishlist'

  # categories and fandoms
  get '/tshirts' => 'pages#tshirts'
  get '/iphonecases' => 'pages#iphonecases'
  get '/stickers' => 'pages#stickers'
  get '/prints' => 'pages#prints'
  get '/fandoms' => 'pages#fandoms'


  #Fandom pages "oh what fun..."
  get '/marvel' => 'fandoms#marvel'
  get '/dc' => 'fandoms#dc'
  get '/star_wars' => 'fandoms#star_wars'
  get '/dr_who' => 'fandoms#dr_who'
  get '/the_walking_dead' => 'fandoms#the_walking_dead'
  get '/supernatural' => 'fandoms#supernatural'
  get '/pokemon' => 'fandoms#pokemon'
  get '/dragonball_z' => 'fandoms#dragonball_z'
  get '/fullmetal_alchemist' => 'fandoms#fullmetal_alchemist'
  get '/sherlock' => 'fandoms#sherlock'
  get '/adventure_time' => 'fandoms#adventure_time'
  get '/game_of_thrones' => 'fandoms#game_of_thrones'

  resources :charges
  get 'profiles/:id/become_artist' => 'profiles#become_an_artist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
