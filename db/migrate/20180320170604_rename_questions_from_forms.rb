class RenameQuestionsFromForms < ActiveRecord::Migration[5.1]

  def change
    rename_column :forms, :question_hash, :question_array
  end
end
