module Opportunities
	class AlertCell < Cell::ViewModel
		include ActionView::Helpers::UrlHelper
		include ActionController::UrlFor
		include Rails.application.routes.url_helpers

		property :id
		property :title
		property :end_subscription

		def show
			render
		end

		def opportunity_link
			link_to model
		end
	end
end
