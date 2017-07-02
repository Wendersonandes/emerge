module Leftbar
	class OpportunitiesCell < Cell::ViewModel
		property :title
		property :summary
		property :featured_image_url
		property :value_of_awards

		def show
			render
		end

		def index
			render
		end

		def image_path_small
			image_path(featured_image_url(:thumb) || "alone-clouds-hills-1909-527x350.jpg")
		end

	end
end
