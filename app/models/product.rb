class Product < ApplicationRecord
  belongs_to :profile
  has_many :carts, :through => :cart_products
end
