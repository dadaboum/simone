class SetDefaultValueAtFalseForPreAndPostFormAnsweredAtSurgeries < ActiveRecord::Migration[5.1]
  def change
    change_column :surgeries, :pre_form_answered, :boolean, default: false
    change_column :surgeries, :post_form_answered, :boolean, default: false
  end
end
