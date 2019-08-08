class Profile < ApplicationRecord
    belongs_to :user
    
    has_many :carts, dependent: :destroy
    has_many :products, dependent: :destroy
    has_one :wishlist, dependent: :destroy
    has_one_attached :avatar
    has_one_attached :cover_image

    

end
