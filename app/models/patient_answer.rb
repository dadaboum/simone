class PatientAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :surgery
end
