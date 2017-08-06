module Emails
	module Partials
		class WrapperCell < Cell::ViewModel

			def show(&block)
				render(&block)
			end

		end
	end
end
