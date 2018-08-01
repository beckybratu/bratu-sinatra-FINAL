class CreateTitleSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :title_subscriptions do |t|
      t.integer :title_id
      t.integer :subscription_id
    end
  end
end
