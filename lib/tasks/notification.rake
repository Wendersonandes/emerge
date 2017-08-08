namespace :notifications do
	desc "Send 7 days for close subscription notification"
	task :closing_in_seven_days => :environment do
		opportunity = Opportunity.last
		opportunity.create_activity key: "opportunity.closing_in_seven_days"
	end	
end
