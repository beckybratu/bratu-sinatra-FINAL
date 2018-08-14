class AddSubscriptionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscription, :string 
  end
end
