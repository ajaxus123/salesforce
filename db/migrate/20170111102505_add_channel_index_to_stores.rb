class AddChannelIndexToStores < ActiveRecord::Migration[5.0]
  def change
    add_reference :stores, :channel, index: true
  end
end
