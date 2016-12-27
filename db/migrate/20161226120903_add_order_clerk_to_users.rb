class AddOrderClerkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :order_clerk, :boolean
  end
end
