class RemoveSubscriptionColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :subscription
  end
end
