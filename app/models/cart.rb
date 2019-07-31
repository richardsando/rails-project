class Cart < ApplicationRecord
  belongs_to :profile
  has_many :cart_products, dependent: :destroy
  has_many :products, :through => :cart_products
  
  before_save :set_default_status, :if => :new_record?

  def set_default_status
    self.active_status = true if self.active_status.nil?
  end

  def time_ordered
    #this method plays around with the time (putting it in the format that we want)
    # 2019-07-30 09:53:08 UTC
    time = updated_at
    time = time.strftime('%m/%d/%Y %H:%M %p')
    return time #time is returned as a string 
  end

end
