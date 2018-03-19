class Form < ApplicationRecord
  has_many :primary_forms, class_name: "Form", foreign_key: "pre_form_id"
  has_many :secondary_forms, class_name: "Form", foreign_key: "post_form_id"
  belongs_to :surgery_type
  has_many :questions
  belongs_to :hospital
end
