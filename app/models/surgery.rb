class Surgery < ApplicationRecord
  belongs_to :pre_form, class_name: "Form"
  belongs_to :post_form, class_name: "Form"
  belongs_to :patient
  belongs_to :surgery_type
  belongs_to :surgeon
  has_many :form_answers
  has_many :events
  validates :status, inclusion: { in: ["urgent", "à traiter", "ok", "non répondu"] }
end
