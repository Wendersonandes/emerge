module Pages
	class AboutCell < Cell::ViewModel

		def image
			options[:content][:image]
		end

		def title
			options[:content][:title]
		end

		def text
			options[:content][:text]
		end

		def open_opportunities
			Opportunity.open.count
		end

		def total_opportunities
			Opportunity.all.count
		end

	end
end
