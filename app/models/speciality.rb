class Speciality < ApplicationRecord

  belongs_to :doctor,dependent: :destroy
  validates :name,:doctor_id,presence:true
  def create_speciality(name,doctor_id)
    Speciality.create(name: name ,doctor_id:doctor_id)
  end


  def update_speciality(id, name ,doctor_id)
    speciality = Speciality.find(id)
    speciality.update(name: name ,doctor_id:doctor_id)
  end
end
