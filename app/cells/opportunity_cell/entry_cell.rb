module OpportunityCell
	class EntryCell < Cell::ViewModel

		property :entry_type
		property :content

		def show
			render
		end

	end
end
