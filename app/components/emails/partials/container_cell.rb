module Emails
	module Partials
		class ContainerCell < Cell::ViewModel

			def show(&block)
				render(&block)
			end

		end
	end
end
