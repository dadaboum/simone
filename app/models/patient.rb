class Patient < ApplicationRecord
  has_many :surgeries
  belongs_to :hospital
end
