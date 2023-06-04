class Clinic < ApplicationRecord
  has_many :departments ,dependent: :destroy
  has_many :patient_cards ,dependent: :destroy
  has_many :doctors, through: :departments
  validates :name,:address,:phone, presence:true

  def insert_into_clinic(name, address, phone)
    sql = "INSERT INTO clinics (name, address, phone) VALUES ('#{name}', '#{address}', '#{phone}')"
    ActiveRecord::Base.connection.execute(sql)
  end


  def update_clinic(id, name, address, phone)
    sql = "UPDATE clinics SET name='#{name}', address='#{address}', phone='#{phone}' WHERE id=#{id}"
    ActiveRecord::Base.connection.execute(sql)
  end

end
