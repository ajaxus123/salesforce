class AddRegionIndexToStores < ActiveRecord::Migration[5.0]
  def change
    add_reference :stores, :region, index: true
  end
end
