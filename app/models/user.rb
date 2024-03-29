class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes
  
  has_one :profile, :dependent => :destroy
  
  
  before_create :add_profile
  
  accepts_nested_attributes_for :profile

    private

    def add_profile
      profile = Profile.create(:id => self.id)
    end
end
