module Users
	class AcountCell < Cell::ViewModel
		include ActionView::RecordIdentifier
		include SimpleForm::ActionViewExtensions::FormHelper
		include Devise::Controllers::UrlHelpers
		include Rails.application.routes.url_helpers
		include Rails.application.routes.mounted_helpers

		def current_user
			options[:context][:current_user]
		end

		def resource_name
			:user
		end

		def devise_mapping
			@devise_mapping ||= Devise.mappings[:user]
		end
	end
end
