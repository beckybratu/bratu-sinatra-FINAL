class Title < ActiveRecord::Base

  has_many :categories
  has_many :title_categories
  belongs_to :subscriptions

end
