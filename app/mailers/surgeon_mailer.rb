class SurgeonMailer < ApplicationMailer
  def notice(surgeon, patient, events, surgery)
    @events = events
    @patient = patient
    @surgeon = surgeon

    #creating event
    event = Event.new
    event.surgery = surgery
    event.description = "Fiche patient transmise au docteur #{@surgeon.name}"
    event.flag = "green"
    event.save!

    mail(to: @surgeon.email, subject: "Relevé d'activités - Clinique du sport - #{@patient.last_name} #{@patient.first_name}")
  end
end
