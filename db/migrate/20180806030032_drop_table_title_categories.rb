class DropTableTitleCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :title_categories
  end
end
