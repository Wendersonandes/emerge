module Opportunities
	class GrantsCell < Cell::ViewModel

		property :name
		property :quantity
		property :description
		property :prizes

		def show
			render
		end

		def grant
			render
		end

		def has_grants?
			model.count > 0
		end
	end
end
