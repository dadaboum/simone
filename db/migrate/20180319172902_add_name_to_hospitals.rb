class AddNameToHospitals < ActiveRecord::Migration[5.1]
  def change
    add_column :hospitals, :name, :string
  end
end
