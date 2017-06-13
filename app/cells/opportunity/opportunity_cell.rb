class OpportunityCell < Cell::ViewModel
	include ApplicationHelper
	include ERB::Util
	include ActionView::Helpers::TranslationHelper
	include SocialShareButton::Helper

	property :content
	property :end_subscription
	property :beginning

  def show
    render
  end

	def body
		markdown(content)
	end

	def header
		render
	end

	def start_date
		handle_date(end_subscription)
	end

	private

	def handle_date(value, message="Data não informada")
		value.present? ? content_tag(:span, value, :class => "ml3") : content_tag(:span, message, :class => "ml3")
	end

end
