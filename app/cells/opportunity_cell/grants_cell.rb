module OpportunityCell
	class GrantsCell < Cell::ViewModel

		property :name
		property :quantity
		property :description
		property :prizes

		def show
			render
		end

		def index
			render
		end


	end
end
