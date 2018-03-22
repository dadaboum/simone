class ChangeFlagToPreFlagInSurgeries < ActiveRecord::Migration[5.1]
  def change
    rename_column :surgeries, :flag, :pre_flag
    add_column :surgeries, :post_flag, :string
  end
end
