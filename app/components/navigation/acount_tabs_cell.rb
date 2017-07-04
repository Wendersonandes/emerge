module Navigation
	class AcountTabsCell < Cell::ViewModel

		def current_user
			options[:context][:current_user]
		end

	end
end
