class User < ActiveRecord::Base

  has_many :subscriptions
  has_many :titles, :through => :subscriptions
  has_secure_password
  validates_uniqueness_of :name
  validates :email, presence: true, uniqueness: true 

end
