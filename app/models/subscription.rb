class Subscription < ActiveRecord::Base

  belongs_to :title
  belongs_to :user


end
