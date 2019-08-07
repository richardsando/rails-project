Rails.application.routes.draw do
  resources :products
  resources :product_variants
  resources :profiles, except: :index
  devise_for :users
  root to: 'pages#fandoms'


  get '/products/:id/add-variant' => 'product_variants#new'

  get '/products/:product_id/edit-variant/:id' => 'product_variants#edit'
  get '/products/:product_id/remove-variant/:id' => 'product_variants#destroy'


  post '/profiles/:id/addproducttocart' => 'profiles#add_product_to_cart'
  
  get '/profiles/:id/addtocart' => 'profiles#add_to_cart' 
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


  #Fandom pages "oh what fun..."
  get '/fandoms/:id' => 'fandoms#fandom'

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
