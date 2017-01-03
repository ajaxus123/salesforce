class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :storename
      t.string :address
      t.string :storecode
      t.string :contactname
      t.string :phonenumber

      t.timestamps
    end
  end
end
