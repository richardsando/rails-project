class Fandom < ApplicationRecord
    has_many :products
    has_one_attached :uploaded_image
end
