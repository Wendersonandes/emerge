module Navigation
	class FooterCell < Cell::ViewModel
		def font_class
			options[:class] ||= "f4"
		end
	end
end
