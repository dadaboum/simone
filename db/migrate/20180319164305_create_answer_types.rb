class CreateAnswerTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_types do |t|
      t.string :description
      t.boolean :has_photo
      t.boolean :accept_multiple_answers
      t.boolean :is_mandatory

      t.timestamps
    end
  end
end
