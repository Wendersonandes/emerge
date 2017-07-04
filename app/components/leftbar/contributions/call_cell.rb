module Leftbar
	module Contributions
		class CallCell < Cell::ViewModel

			def current_user
				options[:context][:current_user]
			end

			def show
				current_user ? render : ""
			end

		end
	end
end
