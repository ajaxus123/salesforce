class AddHashIdToStores < ActiveRecord::Migration[5.0]
  
def up
   add_column :stores, :hash_id, :string, index: true
   Store.all.each{|m| m.set_hash_id; m.save}
  end

  def down
   remove_column :stores, :hash_id, :string
  end
end
