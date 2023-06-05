class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :crm
      t.references :clinic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
