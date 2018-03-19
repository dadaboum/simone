class CreateSurgeryTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :surgery_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
