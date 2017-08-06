module Emails
	module Partials
		class FooterCell < Cell::ViewModel
			property :company_name 
			property :address

			def show
				render
			end

			def current_year
				Date.today.year
			end

			def full_text
				"#{company_name} #{current_year} #{address}"
			end
		end
	end
end
