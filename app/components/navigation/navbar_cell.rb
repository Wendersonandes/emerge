module Navigation
	class NavbarCell < Cell::ViewModel
		include Devise::Controllers::Helpers

		def show
			render
		end
		
		def current_user
			options[:context][:current_user]
		end

	end
end
