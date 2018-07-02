class Subscription < ActiveRecord::Base

  has_many :titles
  belongs_to :user

end
