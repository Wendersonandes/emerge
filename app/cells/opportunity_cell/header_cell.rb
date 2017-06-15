module OpportunityCell
	class HeaderCell < Cell::ViewModel
		include ApplicationHelper
		include ERB::Util
		include ActionView::Helpers::TranslationHelper
		include SocialShareButton::Helper
		include Devise::Controllers::Helpers

		property :end_subscription
		property :id
		property :beginning
		property :result
		property :title
		property :url_source
		property :email_contact
		property :featured_image_url
		property :category_list
		property :value_of_awards
		property :docs
		property :grants
		property :entry_manners

		def show
			render
		end

		def start_date
			handle_date(beginning)
		end

		def end_date
			handle_date(end_subscription)
		end

		def result_date
			handle_date(result)
		end

		def grants_formatted
			grants.present? ? humanized_money_with_symbol(value_of_awards) : "Não informado"
		end

		def category_list_formated
			if category_list.present?
				category_list.map{ |tag|
					content_tag(:span, tag, :class => "label label-info mr2")
				}
			else
				content_tag(:div,"Categoria não informada", :class => "col-sm-12 white")
			end
		end

		def entry_manners_formated
			if entry_manners.present?
				result = "" 
				entry_manners.each do |entry_manner|
					result << case entry_manner.entry_type.to_sym
					when :correios then  display_entry_with_icon("glyphicon glyphicon-send",:correios.to_s.humanize)
					when :online then display_entry_with_icon("glyphicon glyphicon-link", "Online")	
					when :email then display_entry_with_icon("glyphicon glyphicon-envelope", "Email")
					when :indicacao then "Indicação"
					when :nao_definido then "Não definido"
					when :correios_ou_internet then "Correios ou internet"
					end
				end
				result
			else
				"Forma de Inscrição não informada"
			end
		end

		private

		def handle_date(value, message="Data não informada")
			if value.present? 
				content_tag(:span, :class => "ml2") do
					result = ""
					result << value.to_s
					result << content_tag(:span,nil, :class => "cronogram ml2", :data => {:datetime => "(#{value})"})
				end
			else
				content_tag(:span, message, :class => "ml2")
			end
		end

		def display_entry_with_icon(icon_class, value)
			content_tag(:h6, :class => "white fw2") do
			 result = ""
			 result << content_tag(:span,nil ,:class => icon_class)
			 result << " Forma de Inscrição: "
			 result << value
			 result
			end
		end

	end
end
