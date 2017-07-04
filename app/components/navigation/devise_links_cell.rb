module Navigation
	class DeviseLinksCell < Cell::ViewModel
		include Devise::Controllers::Helpers
		include Devise::Controllers::UrlHelpers
		include Rails.application.routes.url_helpers
		include Rails.application.routes.mounted_helpers

		def show
			if user_signed_in?
				render :user_signed_in
			else
				render :user_not_signed_in
			end
		end

		def resource_name
			:user
		end

		def resource
			@resource ||= User.new
		end

		def devise_mapping
			@devise_mapping ||= Devise.mappings[:user]
		end

	end
end
