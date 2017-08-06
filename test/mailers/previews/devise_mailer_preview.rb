class Devise::MailerPreview < ActionMailer::Preview

	def confirmation_instructions
		Devise::Mailer.confirmation_instructions(User.last, "fake_token")
	end

	def reset_password_instructions
		Devise::Mailer.reset_password_instructions(User.last, "fake_token")
	end

	def unlock_instructions
		Devise::Mailer.unlock_instructions(User.last, "fake_token")
	end

end
