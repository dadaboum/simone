class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :surgeries, foreign_key: true
      t.string :description
      t.string :flag

      t.timestamps
    end
  end
end
