	module Users
		class SignUpCell < Cell::ViewModel
			include ActionView::RecordIdentifier
			include SimpleForm::ActionViewExtensions::FormHelper
			include Devise::Controllers::UrlHelpers
			include Rails.application.routes.url_helpers
			include Rails.application.routes.mounted_helpers

			def show
				render
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
