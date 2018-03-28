class Patient < ApplicationRecord
  has_many :surgeries
  belongs_to :hospital

  include PgSearch
  multisearchable :against => [:first_name, :last_name]
end
