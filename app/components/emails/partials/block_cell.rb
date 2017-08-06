module Emails
	module Partials
		class BlockCell < Cell::ViewModel
			property :title
			property :summary
			property :id
			property :featured_image_url

			def show
				render
			end

			def short_title
				truncate(title, length: 75, omission: '...')
			end

			def model_show_link
				"#{Settings.env.FULL_URL}/#{model.class.name.downcase.pluralize}/#{id}"
			end

			def display_image
				featured_image_url(:email_thumb, :public => true) || ("http://res.cloudinary.com/wendersonandes/image/upload/v1463780449/alone-clouds-hills-1909-527x350_y4lu2a.jpg")
			end

			def td_width
				if options[:count] === 2
					return 290
				elsif options[:count] === 3
					return 190
				end
			end

		end
	end
end
