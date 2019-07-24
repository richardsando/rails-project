class Wishlist < ApplicationRecord
  belongs_to :profile
  has_many :wishlist_products
  has_many :products, through: :wishlist_products
end
