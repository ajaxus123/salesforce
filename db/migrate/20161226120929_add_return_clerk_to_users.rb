class AddReturnClerkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :return_clerk, :boolean
  end
end
