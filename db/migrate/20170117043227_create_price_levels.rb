class CreatePriceLevels < ActiveRecord::Migration
  def change
    create_table :price_levels do |t|
      t.references :brand, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
