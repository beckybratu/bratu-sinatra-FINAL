class TitleCategory < ActiveRecord::Base

  belongs_to :title
  belongs_to :category

end
