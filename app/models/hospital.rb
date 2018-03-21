class Hospital < ApplicationRecord
  has_many :users
  has_many :forms
  has_many :patients
  has_many :surgeries, through: :patients
end
