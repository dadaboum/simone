class AddPreFormIdToSurgeries < ActiveRecord::Migration[5.1]
  def change
    add_column :surgeries, :pre_form_id, :integer
    add_column :surgeries, :post_form_id, :integer
  end
end
