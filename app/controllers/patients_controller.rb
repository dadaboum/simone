class PatientsController < ApplicationController


  # def list_send_message
  #   # Ensemble des patients qui ont une opération en cours et qui n'ont pas eu le texto pre-op


  #   Patient.select("patients.*").joins(surgeries: :events).where.not("events.description = ?", "pending")
  #   pre_op = Patient.select("patients.*").joins(:surgeries).where("surgeries.date = #{Time.now.strftime("%a, %e %B, %Y")}")
  #   post_op = Patient.select("patients.*").joins(:surgeries).where("surgeries.date = #{Time.now.strftime("%a, %e %B, %Y")}")

  #   pre_op.each do |user|
  #     message = "Bonjour #{user.last_name} #{user.first_name}, vous trouverez ci dessous l'url pour votre questionnaire pré-opération :
  #     https://davidbenamran.typeform.com/to/Dcyfaj. Merci"
  #     TwilioTextMessenger.new(user.phone_number, message).call
  #   end
  # end
end
