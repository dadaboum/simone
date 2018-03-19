class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
