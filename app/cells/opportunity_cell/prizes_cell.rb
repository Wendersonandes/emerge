module OpportunityCell
	class PrizesCell < Cell::ViewModel

		property :prize_type_list
		property :exact_value
		property :value

		def show
			render
		end

		def value_formatted
			humanized_money_with_symbol(value)
		end

	end
end
