class Mailer < ActionMailer::Base
	default from: 'no-replay@polza.co'
  def invitation(mail, subject)
    mail(to: mail, subject: subject)
  end
end