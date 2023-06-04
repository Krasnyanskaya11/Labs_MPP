class Patient < ApplicationRecord
  #belongs_to :patient_card ,dependent: :destroy

  has_one :patient_card ,dependent: :destroy
  validates :email ,presence: :true ,uniqueness: :true
  validates :bd,:surname,:name,:phone,presence:true
  def create_patient(name, surname,phone,bd,email)
    Patient.create(name: name, surname:surname,phone:phone,bd:bd,email:email)
  end

  # Метод для обновления записи в таблице patient
  def update_patient(id,name, surname,phone,bd,email)
    patient = Patient.find(id)
    patient.update(name: name, surname:surname,phone:phone,bd:bd,email:email)
  end
  def full_name
    "#{name} #{surname}"
  end
end
