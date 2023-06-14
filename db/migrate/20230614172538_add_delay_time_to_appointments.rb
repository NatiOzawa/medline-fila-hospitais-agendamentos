class AddDelayTimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :delay_time, :integer
  end
end
