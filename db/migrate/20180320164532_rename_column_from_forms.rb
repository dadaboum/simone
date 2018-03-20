class RenameColumnFromForms < ActiveRecord::Migration[5.1]
  def change
    rename_column :forms, :questions, :question_hash
  end
end
