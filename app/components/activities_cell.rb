class ActivitiesCell < Cell::ViewModel
	property :key
	property :trackable
	property :owner
	property :parameters

	def show
		render
	end

	def item
		case key
			when "opportunity.closing_in_seven_days" then render 'opportunities/closing_in_seven_days'
			when "opportunity.commented_on" then render 'comments/commented_on'
		end
	end

end
