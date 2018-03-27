class AddColumnPhotoToHospitals < ActiveRecord::Migration[5.1]
  def change
    add_column :hospitals, :photo, :string
  end
end
