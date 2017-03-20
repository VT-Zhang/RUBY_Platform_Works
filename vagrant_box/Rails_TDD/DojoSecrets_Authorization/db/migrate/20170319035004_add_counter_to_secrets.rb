class AddCounterToSecrets < ActiveRecord::Migration
  def change
    add_column :secrets, :counter, :integer
  end
end
