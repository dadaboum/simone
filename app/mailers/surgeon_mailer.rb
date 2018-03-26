class SurgeonMailer < ApplicationMailer
  def notice(surgeon, patient, events)
    @events = events
    @patient = patient
    @surgeon = surgeon
    mail(to: @surgeon.email, subject: "Evenements - Clinique du sport - #{@patient.first_name} #{@patient.last_name}")
  end
end
