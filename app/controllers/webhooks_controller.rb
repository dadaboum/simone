class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def receive
    # getting data
    data = params.as_json
    response = data["form_response"]
    typeform_id = response["form_id"]

    # getting linked instances
    form = Form.find_by(typeform_id: typeform_id)
    surgery_id = response["hidden"]["surgery_id"].to_i
    surgery = Surgery.find(surgery_id)

    # creating form_answer
    form_answer = FormAnswer.new
    form_answer.form = form
    form_answer.surgery = surgery
    form_answer.webhook_answer = data
    form_answer.answer_array = data['webhook']['form_response']['answers']
    form_answer.date_submit = response['submitted_at']
    form_answer.save!

    #updating 'answered' status of preform / postform in surgery
    surgery.pre_form_answered = true if form.pre_or_post == "pre"
    surgery.post_form_answered = true if form.pre_or_post == "post"
    surgery.save!

    #creating event
    event = Event.new
    score = response["calculated"]["score"]
    if score == 0
      event.flag = "green"
      event.description = "Formulaire rempli : Ok - Rien à signaler"
    elsif score < 100
      event.flag = "orange"
      event.description = "Formulaire rempli : A vérifier"
    else
      event.flag = "red"
      event.description = "Formulaire rempli : Alerte"
    end
    event.surgery = surgery
    event.save!

    head 200
  end
end
