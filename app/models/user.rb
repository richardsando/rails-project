class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

belongs_to :role
after_initialize :set_default_role, :if => :new_record?
after_create :create_initial_profile

has_one :profile, dependent: :destroy   #if the user is deleted then the profile follows and is deleted with it

  private
  def set_default_role
    self.role = Role.first
  end

  private
  def create_initial_profile
    
    Profile.create!(id: Profile.last.id + 1, username: self.email, user_id: self.id)
    # raise
  end
end
