class Catalog < ApplicationRecord
  belongs_to :clinic
  belongs_to :doctor
  belongs_to :department
end