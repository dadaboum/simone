class Question < ApplicationRecord
  belongs_to :form
  belongs_to :answer_type
  has_many :alert_raisers
  has_many :suggested_answers
  has_many :patient_answers
end
