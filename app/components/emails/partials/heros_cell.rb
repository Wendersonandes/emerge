module Emails
	module Partials
		class HerosCell < Cell::ViewModel
			property :featured_image_url

			def background_image_text_overlay
				render
			end

			def single_image_hero
				render
			end

			def display_image
				featured_image_url(:thumb, :public => true) || ("http://res.cloudinary.com/wendersonandes/image/upload/v1463780449/alone-clouds-hills-1909-527x350_y4lu2a.jpg")
			end

			def image_hero_with_mobile_block
				render
			end

		end
	end
end
