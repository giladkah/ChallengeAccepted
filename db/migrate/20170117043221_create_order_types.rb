class CreateOrderTypes < ActiveRecord::Migration
  def change
    create_table :order_types do |t|
      t.references :brand, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
