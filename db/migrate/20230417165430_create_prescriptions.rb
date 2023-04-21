class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|

      t.timestamps
    end
  end
end
