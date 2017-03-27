class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :type
      t.integer :year
      t.integer :mileage
      t.references :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
