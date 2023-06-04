class AddIndexToDoctorIdInPatientCards < ActiveRecord::Migration[7.0]
  def change
    add_index :patient_cards, :doctor_id
  end
end
