
 require 'faker'
=begin
#####Clinic.connection.execute("ALTER SEQUENCE  Clinic  RESTART WITH 1;")
#---------------------------------------------------
#Clinic.where("id >= ?",2).destroy_all
Clinic.destroy_all
100.times do |index|
 clinic = Clinic.create(name: Faker::Company.name,
                        address: Faker::Address.full_address,
                         phone:Faker::PhoneNumber.phone_number)
end

#------------------------------------------------------
#Department.where("id >= ?",5).destroy_all
Department.destroy_all
100.times do |index|
Department.create(name: Faker::Company.name+ "  Department",clinic_id:Clinic.all.sample.id )
end

#--------------------------------------------------------
#Doctor.where("id >= ?",6).destroy_all
Doctor.destroy_all
100.times do |index|
 Doctor.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, department_id:Department.all.sample.id)
end

#-----------------------------------------------------------
#Speciality.where("id >= ?",4).destroy_all
Speciality.destroy_all
100.times do |index|
 Speciality.create(name: Faker::Company.name + " Speciality", doctor_id:Doctor.all.sample.id)
end
#-------------------------------------------------------------
#Patient.where("id >= ?",4).destroy_all
Patient.destroy_all
100.times do |index|
 Patient.create(name: Faker::Name.first_name, surname: Faker::Name.last_name,phone:Faker::PhoneNumber.phone_number,bd:Faker::Date.birthday(min_age: 14,max_age: 100),email:Faker::Internet.email)
end
#------------------------------------------------------------
#PatientCard.where("id >= ?",4).destroy_all
PatientCard.destroy_all
100.times do |index|
PatientCard.create(diagnosis: Faker::Fantasy.name, data_st:Faker::Date.between(from:'2000-01-01',to:Date.today),clinic_id:Clinic.all.sample.id ,patient_id:Patient.all.sample.id )
end

#-----------------------------------------------------------------
=end
 #очистить тільки поле з роком
 #Clinic.update_all(year_founded: nil)
 #
 #Clinic.all.each do |record|
 # record.update(year_founded: rand(1900..  Time.now.year))
 #end

 #100.times do

 # PatientCard.where(doctor_id: 63).update_all(doctor_id:Doctor.all.sample.id)
 #end

 Doctor_count = Doctor.count

 100.times do
   PatientCard.where(doctor_id: 77).update_all(doctor_id: Doctor.offset(rand(Doctor_count)).first.id)
 end
