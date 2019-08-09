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

  get '/profiles/:id/showcart/:purchase_id/change-qty' => 'profiles#change_item_qty'   #need to find a better way to do this through the controller


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

  get '/categories/:id' => 'pages#show'
  # get '/tshirts' => 'pages#tshirts'
  # get '/iphonecases' => 'pages#iphonecases'
  # get '/stickers' => 'pages#stickers'
  # get '/prints' => 'pages#prints'




  #Fandom pages "oh what fun..."
  get '/fandoms/:id' => 'fandoms#fandom'



  resources :charges
  get 'profiles/:id/become_artist' => 'profiles#become_an_artist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
