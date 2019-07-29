Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'pages#home'
  get 'profiles/:id/cart' => 'profiles#cart'
  resources :charges
  get 'profiles/:id/become_artist' => 'profiles#become_an_artist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
