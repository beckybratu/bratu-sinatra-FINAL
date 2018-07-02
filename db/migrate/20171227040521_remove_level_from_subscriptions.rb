class RemoveLevelFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :level, :string
  end
end
