class CreateSurgeries < ActiveRecord::Migration[5.1]
  def change
    create_table :surgeries do |t|
      t.integer :encrypted_id
      t.references :patient, foreign_key: true
      t.references :surgery_type, foreign_key: true
      t.boolean :is_done
      t.date :date
      t.references :surgeon, foreign_key: true
      t.boolean :pre_form_answered
      t.boolean :post_form_answered

      t.timestamps
    end
  end
end
