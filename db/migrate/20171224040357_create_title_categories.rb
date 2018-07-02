class CreateTitleCategories < ActiveRecord::Migration
  def change
    create_table :title_categories do |t|
     t.integer :title_id
     t.integer :category_id
   end
  end
end
