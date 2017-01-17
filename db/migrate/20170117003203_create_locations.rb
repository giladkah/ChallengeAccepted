class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :brand, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
