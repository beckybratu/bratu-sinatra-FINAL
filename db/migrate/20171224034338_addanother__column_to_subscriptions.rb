class AddanotherColumnToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :level, :string
  end
end
