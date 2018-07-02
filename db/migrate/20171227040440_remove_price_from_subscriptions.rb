class RemovePriceFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :price, :integer
  end
end
