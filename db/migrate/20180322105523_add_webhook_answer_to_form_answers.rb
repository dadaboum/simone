class AddWebhookAnswerToFormAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :form_answers, :webhook_answer, :jsonb
  end
end
