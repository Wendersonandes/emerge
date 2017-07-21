class PagesCell < Cell::ViewModel
	def image
		options[:content][:image]
	end

	def title
		options[:content][:title]
	end

	def text
		options[:content][:text]
	end

end
