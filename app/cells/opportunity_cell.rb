class OpportunityCell < Cell::ViewModel
	include ApplicationHelper
	include SocialShareButton::Helper
	property :content
  def show
    render
  end

	def body
		markdown(content)
	end

	def header
		render
	end

end
