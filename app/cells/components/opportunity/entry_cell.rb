module Components
	module Opportunity
		class EntryCell < Cell::ViewModel

			property :entry_type
			property :content

			def show
				render
			end

			def entry
				render
			end

			def has_entries?
				model.count > 0
			end

			def model_name_formatted
				"Inscrição".pluralize(model.count)
			end

		end
	end
end
