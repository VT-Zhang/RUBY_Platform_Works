class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.date :birthday
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
