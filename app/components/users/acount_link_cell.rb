module Users
	class AcountLinkCell < Cell::ViewModel
		property :id
		property :name
		property :email
		property :person

		def show
			model ? render : ""
		end

	end
end
