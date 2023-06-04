class Doctor < ApplicationRecord
  has_one :speciality
  belongs_to :department
  has_many :patient_cards
  validates :name,:surname,:department_id,presence:true
  def insert_into_doctor(name,surname, department_id)
    sql = "INSERT INTO doctors (name,surname, department_id) VALUES ('#{name}', '#{surname}', #{department_id})"
    ActiveRecord::Base.connection.execute(sql)
  end

  def update_doctor(id, name, surname,department_id)
    sql = "UPDATE doctors SET name='#{name}',surname='#{surname}', department_id=#{department_id} WHERE id=#{id}"
    ActiveRecord::Base.connection.execute(sql)
  end

  def full_name
    "#{name} #{surname}"
  end

end