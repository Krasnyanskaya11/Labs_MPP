Doctor.all.each do |doctor|
  PatientCard.where(doctor_id: doctor.id).update_all(doctor_name: doctor.name, doctor_surname: doctor.surname)
end