module Components
	class FiltersCell < Cell::ViewModel

		include ActsAsTaggableOn

		property :name

		def show
			render
		end

		def filter
			render
		end

		def category_link
			link_to opportunities_path(tag: name), :class => "btn btn-xs btn-default mb2 mr2" do
				"<span class=\"glyphicon glyphicon-tag mr1\"></span>" + name
				end
		end
	end
end
