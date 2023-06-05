class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
      t.string :address
      t.string :phone
      t.string :health_insurance
      t.float :long
      t.float :lat
      t.timestamps
    end
  end
end
