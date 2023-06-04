class AddYearFoundedToClinics < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :year_founded, :integer
  end
end
