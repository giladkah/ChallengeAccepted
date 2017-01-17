class CreateDayParts < ActiveRecord::Migration
  def change
    create_table :day_parts do |t|
      t.string :part
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
