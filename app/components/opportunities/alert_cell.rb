module Opportunities
	class AlertCell < Cell::ViewModel

		property :id
		property :title
		property :end_subscription

		def show
			render
		end

		def opportunity_link
			link_to(title, Rails.application.routes.url_helpers.opportunity_path(model), :class => "btn btn-xs btn-default")
		end
	end
end
