class AddChannelToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :channel, :string
  end
end
