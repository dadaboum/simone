class ChangeFlagToStatusInSurgeries < ActiveRecord::Migration[5.1]
  def change
    rename_column :surgeries, :flag, :status
  end
end
