module Users
	class ProfileCell < Cell::ViewModel
		include ActionView::RecordIdentifier
		include ActionView::Helpers::FormHelper
		include ActionView::Helpers::FormOptionsHelper
		include SimpleForm::ActionViewExtensions::FormHelper
		include Devise::Controllers::UrlHelpers
		include Rails.application.routes.url_helpers
		include Rails.application.routes.mounted_helpers

		def current_user
			options[:context][:current_user]
		end

	end
end
