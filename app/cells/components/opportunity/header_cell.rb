module Components
	module Opportunity
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

			def total_awards_value
				grants.present? ? humanized_money_with_symbol(value_of_awards) : "Não informado"
			end

			def category_list_formated
				if category_list.present?
					category_list.map{ |tag|
						link_to tag, :class => "label label-info mr2" do
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

			def render_docs_button_formatted
				if docs.present? 
					content_tag(:button, :type => "button", :class => "btn btn-sm btn-primary", :"dropdown-toggle" => nil, :data => {:toggle => "dropdown"}) do
						"<span class=\"glyphicon glyphicon-folder-open mr2\"></span>" +
						"Downloads" +
						"<span class=\"caret\"></span>"
					end
				else
					content_tag(:button, :type => "button", :class => "btn btn-sm btn-default") do
						"<span class=\"glyphicon glyphicon-folder-open mr2\"></span> " + "Não existe documento" 
					end
				end
			end

			def render_docs_button_menu
				if docs.present? 
					content_tag(:ul, :class => "dropdown-menu") do
						result = ""
						docs.each do |doc|
							result << content_tag(:li) do
								link_to doc.doc_url do 
									"<span class=\"glyphicon glyphicon-save\"></span> #{doc.doc_type}"
								end
							end
						end
						result
					end
				end
			end

			def render_follow_button
				if user_signed_in? 
					if model.followed_by?(current_user.person)
						link_to opportunity_follow_opportunity_path(model.to_param, current_user.person.get_follow(model).id), :class => "btn btn-sm btn-success", :method => :delete, :remote => true do
							"<span class=\"glyphicon glyphicon-bookmark mr2\" aria-hidden=\"true\"></span>Seguindo"
						end
					else
						link_to opportunity_follow_opportunities_path(model.to_param), :class => "btn btn-sm btn-default", :remote => true, method: :post do
							"<span class=\"glyphicon glyphicon-bookmark mr2\" aria-hidden=\"true\"></span>Seguir"
						end
					end
				end
			end

			private

			def handle_date(value, message="Data não informada")
				if value.present? 
					content_tag(:span, :class => "ml2") do
						value.to_s +
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
end
