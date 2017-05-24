class OpportunityDecorator < ApplicationDecorator  
	delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

	def beginning
		handle_date(object.beginning)
	end

	def end_subscription
		handle_date(object.end_subscription)
	end

	def result
		handle_date(object.result)
	end

	def content
		markdown(object.content)
	end

	def summary
		markdown(object.summary)
	end

	def downloads
		object.docs.each do |doc|
			concat h.content_tag(:li, h.link_to(doc.doc_url))
		end	
	end


	private

	def handle_date(value, message="Data não informada")
		value.present? ? h.local_time_ago(value) : message
	end
end
