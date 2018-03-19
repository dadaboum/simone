class SurgeryType < ApplicationRecord
  has_many :surgeries
  has_many :forms
end
