module OpportunityCell
	class EntryCell < Cell::ViewModel

		include ApplicationHelper

		property :entry_type
		property :content

		def show
			render
		end

		def content_formatted
			markdown(content)
		end
		
	end
end
