class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.boolean :order
      t.boolean :crm
      t.boolean :floorwalk
      t.text :comment
      t.decimal :order_value
      t.text :price_survey
      t.references :store, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
