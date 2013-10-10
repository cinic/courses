class Mailer < ActionMailer::Base
	default from: "\"Polza.co Support\" <support@polza.co>"
  def invitation(mail, subject)
    mail(to: mail, subject: subject)
  end
end