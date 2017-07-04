module Opportunities
	class TaxesCell < Cell::ViewModel
		include ActionView::Helpers::TextHelper
		include MoneyRails::ActionViewExtension

		property :value
		property :description
		property :tax_type

		def show
			render
		end
		
		def tax
			render
		end

		def has_tax?
			model.count > 0
		end

		def value_formatted
			humanized_money_with_symbol(value)
		end

	end
end
