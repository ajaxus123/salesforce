class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :storename
      t.string :address1
      t.string :address2
      t.string :suburb
      t.string :city
      t.string :state
      t.string :contactname
      t.string :phonenumber
      t.string :channel

      t.timestamps
    end
  end
end
