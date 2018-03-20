class AddTypeformIdToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :typeform_id, :string
  end
end
