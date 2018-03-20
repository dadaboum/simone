class CreateFormAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :form_answers do |t|
      t.references :form, foreign_key: true
      t.references :surgery, foreign_key: true
      t.jsonb :answer_hash
    end
  end
end
