class Product < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :fandom
  has_many :wishlist_products, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :carts, :through => :cart_products
  has_many :wishlists, :through => :wishlist_products
  has_many_attached :uploaded_image

  # def self.search(search)
  #   if search
  #     product = Product.find_by(name: search)
  #     if product
  #       self.where(product_id: product)
  #     else 
  #       Product.all
  #     end
  #   else
  #     Product.all
  #   end
  # end


end
