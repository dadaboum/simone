class SurgeonMailer < ApplicationMailer
  def notice(surgeon, patient, events)
    @events = events
    @patient = patient
    @surgeon = surgeon
    mail(to: @surgeon.email, subject: "Relevé d'activités - Clinique du sport - #{@patient.last_name} #{@patient.first_name}")
  end
end
