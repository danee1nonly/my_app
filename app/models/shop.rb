class Shop < ActiveRecord::Base
  has_many :loyalties, :dependent => :destroy
  has_many :users, :through => :loyalties
  belongs_to :owner

end