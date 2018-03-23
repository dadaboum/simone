class ChangePreAndPostFlagsInSurgeriesToStatus < ActiveRecord::Migration[5.1]
  def change
    remove_column :surgeries, :post_flag
    rename_column :surgeries, :pre_flag, :flag
  end
end
