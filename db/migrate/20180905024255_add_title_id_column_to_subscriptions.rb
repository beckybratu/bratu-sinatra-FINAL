class AddTitleIdColumnToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :title_id, :integer
  end
end
