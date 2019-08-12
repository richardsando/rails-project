Rails.application.routes.draw do
  resources :products
  resources :product_variants, except: :index
  resources :profiles, except: :index
  devise_for :users
  resources :charges
  root to: 'pages#fandoms'

  #PROFILES
  post '/user_does_not_exist' => 'profiles#no_user'
  get '/user_does_not_exist_wishlist' => 'profiles#no_user_for_wishlist'

  #PRODUCTS
  get '/products/:id/add-variant' => 'product_variants#new'
  get '/products/:product_id/edit-variant/:id' => 'product_variants#edit'
  get '/products/:product_id/remove-variant/:id' => 'product_variants#destroy'

  #CART
  get '/profiles/:id/addtocart' => 'carts#add_to_cart' 
  get '/profiles/:id/showcart' => 'carts#showcart' 
  get '/profiles/:id/showcart/remove-item' => 'carts#remove_cart_item'
  get '/profiles/:id/checkout_cart' => 'carts#checkout_cart'
  get '/profiles/:id/previous_orders' => 'carts#previous_orders'
  post '/profiles/:id/addproducttocart' => 'carts#add_product_to_cart'   
  get '/profiles/:id/showcart/:purchase_id/change-qty' => 'carts#change_item_qty' 

  #WISHLIST
  get '/profiles/:id/addtowishlist' => 'wishlists#add_to_wishlist' 
  get '/profiles/:id/show-wishlist' => 'wishlists#show_wishlist' 
  get '/profiles/:id/show-wishlist/remove-item' => 'wishlists#remove_wishlist_item'
  get '/profiles/:id/show-wishlist/remove-item-on-wishlist' => 'wishlists#remove_item_on_wishlist_page' 

  # categories and fandoms
  get '/categories/:id' => 'pages#show'


  #Fandom pages "oh what fun..."
  get '/fandoms/:id' => 'fandoms#fandom'


  #CHARGES
  get '/profiles/:id/become_an_artist' => 'profiles#become_an_artist'
  post '/charges/become_artist_success' => 'charges#become_artist'
  post '/charges/checkout_cart_success' => 'charges#checkout_cart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
