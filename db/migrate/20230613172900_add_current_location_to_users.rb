class AddCurrentLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :current_lat, :float
    add_column :users, :current_long, :float
  end
end
