class AddSubmitDateToFormAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :form_answers, :submit_date, :datetime
  end
end
