class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  # or 
  # before_validation :set_default_role 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

belongs_to :role
after_initialize :set_default_role, :if => :new_record?

has_one :profile, dependent: :destroy   #if the user is deleted then the profile follows and is deleted with it

  private
  def set_default_role
    self.role = Role.first
  end
end
