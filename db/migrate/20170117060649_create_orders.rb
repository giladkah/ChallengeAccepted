class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :price_level
      t.integer :price
      t.references :menu_item, index: true, foreign_key: true
      t.references :order_type, index: true, foreign_key: true
      t.references :day_part, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
