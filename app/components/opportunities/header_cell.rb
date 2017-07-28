module Opportunities
	class HeaderCell < Cell::ViewModel
		include ApplicationHelper
		include ERB::Util
		include ActionView::Helpers::TranslationHelper
		include SocialShareButton::Helper
		include Devise::Controllers::Helpers
		include MoneyRails::ActionViewExtension

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
		property :grants
		property :entry_manners
		
		def current_user
			options[:context][:current_user]
		end

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

		def total_awards_value
			grants.present? ? humanized_money_with_symbol(value_of_awards) : "Não informado"
		end

		def category_list_formated
			if category_list.present?
				category_list.map{ |tag|
					link_to opportunities_path(tag: tag), :class => "label label-info mr2" do
						"<span class=\"glyphicon glyphicon-tag mr1\"></span>" + tag
					end
				}
			else
				content_tag(:span, "Categoria não informada", :class => "label label-warning mr2")
			end
		end

		def background_image_path_large
			image_path(featured_image_url(:thumb) || "alone-clouds-hills-1909-527x350.jpg")
		end

		def background_image_path_small
			image_path(featured_image_url(:thumb) || "alone-clouds-hills-1909-527x350.jpg")
		end

		def entry_manners_formated
			if entry_manners.present?
				result = "" 
				entry_manners.each do |entry_manner|
					result << case entry_manner.entry_type.to_sym
						when :correios then "Correios"
						when :online then "Online"
						when :email then "Email"
						when :indicacao then "Indicação"
						when :nao_definido then "Não definido"
					end
				end
				display_entry_with_icon("glyphicon glyphicon-envelope", result)
			else
				content_tag(:h6) do
					"<span class=\"glyphicon glyphicon-envelope mr2\"></span> Forma de Inscrição: Não informada"
				end
			end
		end

		def formated_url_source
			url_source ? link_to("Fonte online", url_source, :target => :_blank) : "Não informado"
		end

		private

		def handle_date(value, message="Data não informada")
			if value.present? 
				content_tag(:span, :class => "ml2") do
					I18n.l(value).to_s +
					content_tag(:span,nil, :class => "cronogram ml2", :data => {:datetime => value})
				end
			else
				content_tag(:span, message, :class => "ml2")
			end
		end

		def display_entry_with_icon(icon_class, value)
			content_tag(:h6) do
			 content_tag(:span,nil ,:class => icon_class) +
			 " Forma de Inscrição: " +
			 value
			end
		end

	end
end
