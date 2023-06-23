class FillAppointmentsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :appointments_date, :datetime
    add_reference :appointments, :doctor, null: false, index: true
    add_foreign_key :appointments, :doctors
    add_reference :appointments, :user, null: false, index: true
    add_foreign_key :appointments, :users
  end
end
