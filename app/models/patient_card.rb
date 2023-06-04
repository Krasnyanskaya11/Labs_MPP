class PatientCard < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient
  belongs_to :doctor


  validates :patient_id,:diagnosis,:data_st,:clinic_id,:doctor_id,presence:true


  def create_patient_card(diagnosis, data_st, clinic_id,patient_id)
    PatientCard.create(diagnosis:diagnosis,data_st:data_st,clinic_id:clinic_id,patient_id: patient_id)
  end


  def update_patient_card(id,diagnosis, data_st, clinic_id,patient_id)
    patient_card = PatientCard.find(id)
    patient_card.update(diagnosis:diagnosis,data_st:data_st,clinic_id:clinic_id,patient_id: patient_id)
  end

  attr_accessor :doctor
end
