class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :shop_attributes
  
  has_one :shop, :dependent => :destroy
  
  before_create :add_shop
  
    private

    def add_shop
      shop = Shop.create(:id => self.id)
    end
end
