class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :form, foreign_key: true
      t.string :content
      t.references :answer_type, foreign_key: true

      t.timestamps
    end
  end
end
