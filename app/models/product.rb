class Product < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :fandom
  has_many :wishlist_products, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :carts, :through => :cart_products
  has_many :wishlists, :through => :wishlist_products
  has_one_attached :uploaded_image


end
