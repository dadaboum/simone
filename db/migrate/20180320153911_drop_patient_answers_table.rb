class DropPatientAnswersTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :patient_answers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
