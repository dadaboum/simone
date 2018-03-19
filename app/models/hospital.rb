class Hospital < ApplicationRecord
  has_many :users
  has_many :forms
  has_many :patients
end
