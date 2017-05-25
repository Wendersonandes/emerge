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

	def category_list_formated
		if object.category_list.present?
			h.content_tag(:div, :class => "col-sm-12") do
			object.category_list.map{ |tag|
				h.concat(h.content_tag(:span, tag, :class => "label label-info mr2"))
			}
			end
		else
			h.content_tag(:div,"Categoria não informada", :class => "col-sm-12 white")
		end
	end

  def list_categories
    object.category_list.present? ? object.category_list.take(4) : 'Categoria não informada'
  end

	def download_list
		if object.docs.present?
			h.content_tag(:div) do
				h.concat h.content_tag(:button,"Downloads", :class => "btn btn-sm btn-primary dropdown-toggle", :data => {:toggle => "dropdown"}) do
				h.content_tag(:span,"",:class => "caret")
			end
				h.concat h.content_tag(:ul,"", :class => "dropdown-menu") do
					object.docs.each do |doc|	
						h.content_tag(:li, doc.doc_type)
					end
				end
			end
		else
			h.content_tag(:button,"Não existe nenhum documento",:type => "button", :class => "btn btn-sm btn-primary")
		end
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
		value.present? ? h.local_time_ago(value) + h.content_tag(:span, "(#{value.strftime(" %d/%m/%y ")})", :class => "ml3") : message
	end
end
