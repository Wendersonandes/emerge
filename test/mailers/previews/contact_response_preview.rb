class ContactResponsePreview < ActionMailer::Preview
	def thanks_contact
		user = User.last
		ContactResponseMailer.thanks_contact(user)
	end
end
