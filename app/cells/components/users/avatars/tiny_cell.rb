module Components
	module Users
		module Avatars
			class TinyCell < Cell::ViewModel

				def size
					options[:size] ||= :tiny
				end

				def alt
					options[:alt] ||= ''
				end

				def current_user
					options[:context][:current_user]
				end

			end
		end
	end
end

