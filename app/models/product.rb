class Product < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :fandom
  has_many :wishlist_products
  has_many :cart_products
  has_many :carts, :through => :cart_products
  has_many :wishlists, :through => :wishlist_products

end