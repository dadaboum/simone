class Form < ApplicationRecord
  has_many :primary_forms, class_name: "Form", foreign_key: "pre_form_id"
  has_many :secondary_forms, class_name: "Form", foreign_key: "post_form_id"
  has_many :form_answers
  belongs_to :surgery_type
  belongs_to :hospital
  validates :typeform_id, uniqueness: :true
end
