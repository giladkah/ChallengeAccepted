class CreatePriceConfigurations < ActiveRecord::Migration
  def change
    create_table :price_configurations do |t|
      t.string :order_type
      t.string :day_part
      t.string :price_level
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
