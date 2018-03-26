# Preview all emails at http://localhost:3000/rails/mailers/surgeon_mailer
class SurgeonMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/surgeon_mailer/notice
  def notice
    surgeon = Surgeon.first
    SurgeonMailer.notice(surgeon)
  end

end
