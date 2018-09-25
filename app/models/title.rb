class Title < ActiveRecord::Base

  has_many :subscriptions
  has_many :users, :through => :subscriptions
  validates :name, presence: :true 

end
