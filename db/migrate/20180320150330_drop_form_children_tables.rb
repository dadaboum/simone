class DropFormChildrenTables < ActiveRecord::Migration[5.1]
  def up
    drop_table :answer_types, force: :cascade
    drop_table :questions, force: :cascade
    drop_table :suggested_answers, force: :cascade
    drop_table :alert_raisers, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
