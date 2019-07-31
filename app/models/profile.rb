class Profile < ApplicationRecord
    belongs_to :user
    
    has_many :carts, dependent: :destroy
    has_many :products, dependent: :destroy
    has_one :wishlist, dependent: :destroy
    has_many_attached :uploaded_image




end
