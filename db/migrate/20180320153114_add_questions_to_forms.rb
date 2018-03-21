class AddQuestionsToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :questions, :jsonb
  end
end
