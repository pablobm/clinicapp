class FillingPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :prescriptions, :appointments, index: true, foreign_key: true
    add_column :prescriptions, :prescript, :text
  end
end
