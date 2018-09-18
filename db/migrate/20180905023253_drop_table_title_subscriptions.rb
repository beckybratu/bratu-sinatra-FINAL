class DropTableTitleSubscriptions < ActiveRecord::Migration[5.2]
  def change
    drop_table :title_subscriptions
  end
end
