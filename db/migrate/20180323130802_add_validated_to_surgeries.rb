class AddValidatedToSurgeries < ActiveRecord::Migration[5.1]
  def change
    add_column :surgeries, :validated, :boolean
  end
end
