module Leftbar
	class AddsCell < Cell::ViewModel

		def current_user
			options[:context][:current_user]
		end

		def show
			render
		end

		def website_add
			if current_user.present? &&  current_user.person.website.present?
				render :website 
			else
				render :no_website
			end
		end
	end
end
