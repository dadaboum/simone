class CreatePatientAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_answers do |t|
      t.string :content
      t.references :question, foreign_key: true
      t.references :surgery, foreign_key: true

      t.timestamps
    end
  end
end
