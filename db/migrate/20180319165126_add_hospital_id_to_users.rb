class AddHospitalIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :hospital, foreign_key: true
  end
end
