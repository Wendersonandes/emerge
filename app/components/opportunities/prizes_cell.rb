module Opportunities
	class PrizesCell < Cell::ViewModel
		include MoneyRails::ActionViewExtension

		property :prize_type_list
		property :exact_value
		property :value

		def show
			render
		end

		def value_formatted
			humanized_money_with_symbol(value) + exact_value?
		end

		def exact_value?
			!exact_value ? "(Valor aproximado)" : ""
		end

	end
end
