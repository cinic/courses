class Mailer < ActionMailer::Base
	default from: 'notifications@example.com'
  def invitation(mail, subject)
    mail(to: mail, subject: subject)
  end
end