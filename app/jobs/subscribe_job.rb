class SubscribeJob
	include SuckerPunch::Job

	def perform(user)
		begin
			g = Gibbon::Request.new
			g.lists(ENV['EMERGE_LIST']).members.create(body:{email_address: user.email, 
				double_optin: false,
				status: 'subscribed',
				merge_fields: {FNAME: user.first_name, LNAME:user.last_name}
				})
		rescue Gibbon::MailChimpError => mce
			SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
			raise mce
			
		rescue Exception => e
			SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
			raise e
		end
	end
end