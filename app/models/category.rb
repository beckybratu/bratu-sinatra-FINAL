class Category < ActiveRecord::Base

  has_many :titles
  has_many :title_categories

end
