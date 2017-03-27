class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :a_city
      t.string :a_state
      t.integer :a_zipcode
      t.string :b_city
      t.string :b_state
      t.integer :b_zipcode
      t.date :date
      t.integer :price
      t.references :driver, index: true, foreign_key: true
      t.references :rider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
