module Leftbar
	class OpportunitiesCell < Cell::ViewModel
		property :title
		property :summary
		property :featured_image_url
		property :value_of_awards

		def show
			current_user ? render : ""
		end

		def item
			render
		end

		def current_user
			options[:context][:current_user]
		end

		def image_path_small
			image_path(featured_image_url(:thumb) || "alone-clouds-hills-1909-527x350.jpg")
		end

	end
end
