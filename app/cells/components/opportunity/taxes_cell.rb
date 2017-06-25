module Components
	module Opportunity
		class TaxesCell < Cell::ViewModel

			include ActionView::Helpers::TextHelper

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

			def model_name_formatted
				"Taxa".pluralize(model.count)
			end
		end
	end
end
