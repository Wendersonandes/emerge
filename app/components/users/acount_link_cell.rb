module Users
	class AcountLinkCell < Cell::ViewModel
		property :id
		property :name
		property :email
		property :person
		property :profile_skill_list
		property :first_name
		property :last_name

		def show
			model ? render : ""
		end

		def full_name
			person.fullname.present? ? person.fullname : "#{first_name} #{last_name}"
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
