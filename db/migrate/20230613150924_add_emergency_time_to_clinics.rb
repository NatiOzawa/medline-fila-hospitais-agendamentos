class AddEmergencyTimeToClinics < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :emergency_time, :integer
  end
end
