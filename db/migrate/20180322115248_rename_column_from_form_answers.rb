class RenameColumnFromFormAnswers < ActiveRecord::Migration[5.1]
  def change
    rename_column :form_answers, :answer_hash, :answer_array
  end
end
