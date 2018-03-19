class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.references :surgery_type, foreign_key: true
      t.string :pre_or_post
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
