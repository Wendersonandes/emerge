module OpportunityCell
	class BodyCell < Cell::ViewModel
		include ApplicationHelper

		property :content

		def show
			render
		end
		def content_formatted
			markdown(content)
		end

	end
end
