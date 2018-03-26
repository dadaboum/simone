class ChangeDateSubmitTypeFromTimeToDateTimeInFormAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :form_answers, :date_submit
  end
end
