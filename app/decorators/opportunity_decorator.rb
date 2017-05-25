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

	def entry_manners_formated
		if object.entry_manners.present?
			result = "" 
			object.entry_manners.each do |entry_manner|
				result << case entry_manner.entry_type.to_sym
				when :correios then  display_entry_with_icon("glyphicon glyphicon-send",:correios.to_s.humanize)
				when :online then display_entry_with_icon("glyphicon glyphicon-link", "Online")	
				when :email then display_entry_with_icon("glyphicon glyphicon-envelope", "Email")
				when :indicacao then "Indicação"
				when :nao_definido then "Não definido"
				when :correios_ou_internet then "Correios ou internet"
				end
			end
			result.html_safe
		end
	end


	private

	def display_entry_with_icon(icon_class, value)
		h.content_tag(:h6, :class => "white fw2") do
			h.concat h.content_tag(:span,"", :class =>  icon_class)
			h.concat " Forma de Inscrição: #{value}"
		end
	end

	def handle_date(value, message="Data não informada")
		value.present? ? h.local_time_ago(value) : message
	end
end
