class AddDateSubmitToFormAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :form_answers, :date_submit, :time
  end
end
