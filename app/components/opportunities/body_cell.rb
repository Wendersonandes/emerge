module Opportunities
	class BodyCell < Cell::ViewModel
		include ApplicationHelper

		property :content
		property :entry_manners
		property :grants
		property :taxes

		def show
			render
		end

		def content_formatted
			markdown(content)
		end

		def current_user
			options[:context][:current_user]
		end

	end
end
