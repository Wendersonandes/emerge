module Users
	class AcountLinkCell < Cell::ViewModel
		property :id
		property :name
		property :email
		property :person
		property :profile_skill_list

		def show
			model ? render : ""
		end

		def profile_skill_list_formated
			if person.profile_skill_list.present?
				person.profile_skill_list.map{ |tag|
					content_tag(:span, tag, :class => "label label-info mr2 dib")  
				}
			end
		end

	end
end
