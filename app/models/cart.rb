class Cart < ApplicationRecord
  belongs_to :profile
  has_many :cart_products, dependent: :destroy
  has_many :products, :through => :cart_products
  
  before_save :set_default_status, :if => :new_record?

  def set_default_status
    self.active_status = true if self.active_status.nil?
  end

end
