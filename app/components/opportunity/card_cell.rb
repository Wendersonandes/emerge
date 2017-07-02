module Components
	module Opportunity
		class CardCell < Cell::ViewModel
			include ApplicationHelper
			include ERB::Util
			include ActionView::Helpers::TranslationHelper
			include ActsAsFollower::Follower::InstanceMethods

			property :end_subscription
			property :id
			property :beginning
			property :result
			property :title
			property :summary
			property :url_source
			property :email_contact
			property :featured_image_url
			property :category_list
			property :value_of_awards
			property :docs
			property :grants
			property :entry_manners
			property :impressionist_count
			property :followers_count

			def show
				render
			end

			def start_date
				handle_date(end_subscription)
			end
			def end_date
				handle_date(end_subscription)
			end
			def result_date
				handle_date(end_subscription)
			end

			def category_list_formated
				if category_list.present?
					category_list.map{ |tag|
						link_to tag, opportunities_path(tag: tag), :class => "mb2 mr2"
					}
				end
			end

			def summary_formatted
				markdown(summary)
			end

			def grants_formatted
				grants.present? ? humanized_money_with_symbol(value_of_awards) : "Não informado"
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
					result.html_safe
				end
			end

			private

			def handle_date(value, message="Data não informada")
				value.present? ? content_tag(:span, 
																		 value, 
																		 :class => "ml3") : content_tag(:span, 
																																		message, 
																																		:class => "ml3")
			end

			def display_entry_with_icon(icon_class, value)
				content_tag(:h6, :class => "white fw2") do
					content_tag(:span,"", :class =>  icon_class)
					 " Forma de Inscrição: #{value}"
				end
			end

		end
	end
end
