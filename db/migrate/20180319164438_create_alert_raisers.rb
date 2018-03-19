class CreateAlertRaisers < ActiveRecord::Migration[5.1]
  def change
    create_table :alert_raisers do |t|
      t.integer :alert_type
      t.references :question, foreign_key: true
      t.string :field_to_check

      t.timestamps
    end
  end
end
