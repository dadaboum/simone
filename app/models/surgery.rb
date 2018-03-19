class Surgery < ApplicationRecord
  belongs_to :pre_form, class_name: "Form"
  belongs_to :post_form, class_name: "Form"
  belongs_to :patient
  belongs_to :surgery_type
  belongs_to :surgeon
  has_many :patient_answers
end
