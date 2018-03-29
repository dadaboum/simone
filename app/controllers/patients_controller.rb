class PatientsController < ApplicationController
  def relance_sms
    surgery = Surgery.find(params[:surgery_id])
    sms_content_patient_and_event(surgery)
    flash[:notice] = 'Le message a bien été envoyé'
    redirect_to surgeries_path(status: params[:status], surgery_id: params[:surgery_id], pre_or_post: params[:pre_or_post])
  end

  def sms_batch
    ids = params[:surgery_ids]
    ids.split(",").each do |id|
      surgery = Surgery.find(id)
      sms_content_patient_and_event(surgery)
    end
    i = ids.split(',').size
    flash[:notice] = "#{ids.split(',').size} messages ont bien été envoyés"
    redirect_to surgeries_path
    # TODO: confirmation message
  end

  private

  def sms_content_patient_and_event(surgery)
    patient = surgery.patient
    typeform_pre = Form.find(surgery.pre_form_id).typeform_id
    typeform_post = Form.find(surgery.post_form_id).typeform_id
    if Date.today < surgery.date
      message = "Bonjour, #{patient.first_name} #{patient.last_name}, lien du questionnaire pré-opératoire : https://davidbenamran.typeform.com/to/#{typeform_pre}?surgery_id=#{surgery.id}"
      event = Event.new(description: "relance message pré-opératoire", flag: "green")
    else
      message = "Bonjour, #{patient.first_name} #{patient.last_name}, lien du questionnaire post-opératoire : https://davidbenamran.typeform.com/to/#{typeform_post}?surgery_id=#{surgery.id}"
      event = Event.new(description: "relance message post-opératoire", flag: "green")
    end
    sms = TwilioTextMessenger.new(patient.phone_number, message).call
    event.surgery = surgery
    event.save
  end
end
