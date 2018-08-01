class TitleCategory < ActiveRecord::Base

  belongs_to :title
  belongs_to :subscription

end
