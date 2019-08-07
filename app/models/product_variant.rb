class ProductVariant < ApplicationRecord
  belongs_to :product
  # dependent: :destroy
  belongs_to :size
  belongs_to :color, optional: true
  
  has_many :products_purchaseds, dependent: :destroy
  has_many :carts, :through => :products_purchaseds
end
