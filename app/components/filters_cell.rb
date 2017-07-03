class FiltersCell < Cell::ViewModel

	include ActsAsTaggableOn

	property :name

	def filter
		render
	end

end
