class AddAppointmentToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :prescriptions, :appointment, null: false, foreign_key: true
  end
end
