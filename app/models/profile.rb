class Profile < ApplicationRecord
    belongs_to :user
    has_many :carts
    has_many :products
    has_one :wishlist
end
