class ProductsPurchased < ApplicationRecord
  belongs_to :cart
  belongs_to :product_variant
end
