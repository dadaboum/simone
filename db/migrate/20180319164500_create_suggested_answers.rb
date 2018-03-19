class CreateSuggestedAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :suggested_answers do |t|
      t.string :content
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
