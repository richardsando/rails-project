class Cart < ApplicationRecord
  belongs_to :profile
  has_many :products, :through => :cart_products
end
