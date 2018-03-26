class PatientsController < ApplicationController
  def relance_sms
    surgery = Surgery.find(params[:surgery_id])
    patient = surgery.patient
    if Date.today < surgery.date
      message = "Bonjour, #{patient.first_name} #{patient.last_name}, lien du questionnaire pré-opératoire : https://davidbenamran.typeform.com/to/Dcyfaj?surgery_id=#{params[:surgery_id]}"
      event = Event.new(description: "relance message pré-opératoire", flag: "green")
    else
      message = "Bonjour, #{patient.first_name} #{patient.last_name}, lien du questionnaire post-opératoire : https://davidbenamran.typeform.com/to/yccqO5?surgery_id=#{params[:surgery_id]}"
      event = Event.new(description: "relance message post-opératoire", flag: "green")
    end
    # sms = TwilioTextMessenger.new(patient.phone_number, message).call
    event.surgery = surgery
    event.save
    flash[:notice] = 'Le message a bien été envoyé'
    redirect_to surgeries_path(status: params[:status], surgery_id: params[:surgery_id], pre_or_post: params[:pre_or_post])
  end
end
