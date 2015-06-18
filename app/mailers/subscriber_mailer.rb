class SubscriberMailer < ApplicationMailer
	default from: "valayvaidya28@gmail.com"

	def everyday_newsletter(email_id)
		@greetings = "Just a test email."
		mail to: email_id, subject: "Daily newsletter"
	end
end
