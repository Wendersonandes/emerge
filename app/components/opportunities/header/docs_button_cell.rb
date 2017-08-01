module Opportunities
	module Header
		class DocsButtonCell < Cell::ViewModel
			property :doc_type
			property :doc_url

			def show
				render
			end

			def item
				render
			end

			def render_docs_button_formatted
				if model.present? 
					result = ""
					result << content_tag(:button, :type => "button", :class => "button button-rounded button-primary button-small button-flat", :"dropdown-toggle" => nil, :data => {:toggle => "dropdown"}) do
						"<span class=\"glyphicon glyphicon-folder-open mr2\"></span> Downloads<span class=\"caret\"></span>"
					end
					result << content_tag(:ul, :class => "dropdown-menu") do
						cell(Opportunities::Header::DocsButtonCell, :collection => model).(:item)
					end
					result
				else
					content_tag(:button, :type => "button", :class => "button button-rounded button-small") do
						"<span class=\"glyphicon glyphicon-folder-open mr2\"></span>  Não existe documento" 
					end
				end
			end

		end
	end
end
