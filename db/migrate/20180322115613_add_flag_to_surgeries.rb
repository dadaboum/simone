class AddFlagToSurgeries < ActiveRecord::Migration[5.1]
  def change
    add_column :surgeries, :flag, :string
  end
end
