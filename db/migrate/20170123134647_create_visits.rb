class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.boolean :order
      t.boolean :return
      t.decimal :order_value
      t.text :store_issue
      t.text :feedback
      t.timestamps
    end
  end
end
