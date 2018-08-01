class Subscription < ActiveRecord::Base

  has_many :titles, through: :title_subscriptions
  has_many :title_subscriptions
  belongs_to :user

  def self.subscription_levels
    ["lite", "extra", "everything"]
  end

end
