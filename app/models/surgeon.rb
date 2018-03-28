class Surgeon < ApplicationRecord
  has_many :surgeries

  include PgSearch
  multisearchable :against => :name
end
