class Loyalty < ActiveRecord::Base
  attr_accessible :points, :name, :profile_id
  belongs_to :profile
  belongs_to :shop
end
