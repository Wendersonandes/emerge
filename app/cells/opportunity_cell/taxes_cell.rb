module OpportunityCell
	class TaxesCell < Cell::ViewModel
		property :value
		property :description
		property :tax_type

		def show
			render
		end
		
		def index
			render
		end

		def value_formatted
			humanized_money_with_symbol(value)
		end
	end
end
