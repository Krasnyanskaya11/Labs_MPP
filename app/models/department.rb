class Department < ApplicationRecord
   belongs_to :clinic
   has_many :doctors ,dependent: :destroy
   validates :name,:clinic_id,presence:true
   def insert_into_department(name, clinic_id)
      sql = "INSERT INTO departments (name, clinic_id) VALUES ('#{name}', #{clinic_id})"
      ActiveRecord::Base.connection.execute(sql)
   end

   def update_department(id, name, clinic_id)
      sql = "UPDATE departments SET name='#{name}', clinic_id=#{clinic_id} WHERE id=#{id}"
      ActiveRecord::Base.connection.execute(sql)
   end

end
