module Navigation
	class SidebarLinksCell < Cell::ViewModel
		def font_class
			options[:class] ||= "f5"
		end
	end
end
