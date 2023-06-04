class AddDoctorIdToPatientCards < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_cards, :doctor_id, :integer
    add_foreign_key :patient_cards, :doctors
  end
end
