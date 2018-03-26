class SurgeonMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.surgeon_mailer.notice.subject
  #

  # def message
  #   mail(
  #     :subject => 'Hello from Postmark',
  #     :to  => 'jjoubert86@gmail.com',
  #     :from => 'noreply@careon.life',
  #     :html_body => '<strong>Hello</strong> dear Postmark user.',
  #     :track_opens => 'true')
  # end
  def notice(surgeon, patient, events)
    @events = events
    @patient = patient
    @surgeon = surgeon
    mail(to: @surgeon.email, subject: 'Mail notification test')
  end
end
