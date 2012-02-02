class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :loyalties
  # has_many :shops, :through => loyalties
end
