class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, null: true
      t.references :user, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.datetime :time
      t.string :status
      t.boolean :emergency, default: false
      t.integer :date_position
      t.jsonb :screening, default: {}
      t.timestamps
    end
  end
end
