class ChangeSurgeriesToSurgeryFromEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :surgeries_id, :surgery_id
  end
end
