class Product < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :fandom
  has_many :wishlist_products, dependent: :destroy

  # has_many :cart_products, dependent: :destroy
  # has_many :carts, :through => :cart_products
  
  # has_many :product_variants, :through => :products


  has_many :wishlists, :through => :wishlist_products
  has_one_attached :uploaded_image

  has_many :product_variants, dependent: :destroy

  def base_price
    if self.product_variants.exists?
      prices = []
      self.product_variants.each do |variant|
        prices << variant.price
      end
      return prices.min
    else
      return 0.0    #for now before we seed all the prices
    end
  
  end
  
end
