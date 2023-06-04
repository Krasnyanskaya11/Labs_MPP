class PatientClinic < ApplicationRecord
  belongs_to :patient_card
  belongs_to :patient

end