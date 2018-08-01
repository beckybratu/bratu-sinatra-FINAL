class Title < ActiveRecord::Base

  has_many :subscriptions, through: :title_subscriptions
  has_many :title_subscriptions

end
