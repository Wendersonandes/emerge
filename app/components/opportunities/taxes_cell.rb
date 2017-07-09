module Opportunities
	class TaxesCell < Cell::ViewModel
		include ActionView::Helpers::TextHelper
		include MoneyRails::ActionViewExtension

		property :value
		property :description
		property :tax_type

		def show
			model ? render : ""
		end
		
		def tax
			render
		end

		def value_formatted
			humanized_money_with_symbol(value)
		end

	end
end
