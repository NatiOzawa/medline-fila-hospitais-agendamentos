class AddFieldsToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :body_area, :string, array: true, default: []
    add_column :appointments, :pain_scale, :integer
    add_column :appointments, :additional_information, :text
  end
end
