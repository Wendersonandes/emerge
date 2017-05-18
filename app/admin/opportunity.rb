ActiveAdmin.register Opportunity do
	permit_params :id,
		:author_id,
		:url_source, 
		:featured_image, 
		:featured_image_remote_url, 
		:title, 
		:beginning, 
		:end_subscription, 
		:result, 
		:extended, 
		:content, 
		:entry_manners_attributes => [:id, :opportunity_id, :content, :entry_type],
		:docs_attributes => [:id, :opportunity_id, :language, :doc_type, :doc, :doc_remote_url, :description, :_destroy],
		:taxes_attributes => [:id, :opportunity_id, :value, :value_currency, :description, :_destroy], 
		:grants_attributes => [:id, :name, :description, :quantity, :opportunity_id, :_destroy, 
												 :prizes_attributes => [:id ,:opportunity_id, :grant_id, :value, :value_currency, :description, :prize_type_list , :exact_value, :_destroy]]
	menu :priority => 1
	scope :all, :default => true

	filter :title
	filter :end_subscription
	filter :beginning

	controller do
		def save_and_edit	
			@opportunity = Opportunity.new(permitted_params[:opportunity])
			@opportunity.save
			redirect_to edit_admin_opportunity(@opportunity), :notice=>'Imported'
		end
	end

	member_action :save_and_edit, :method => :post do

	end

	index do
		column :title do |opportunity|
			link_to truncate(opportunity.title, :length => 100), admin_opportunity_path(opportunity)
		end
		column :summary
		actions
	end

	show do
		panel "Details" do
			attributes_table_for opportunity do
				row :content
			end
		end
		panel "Details II" do
			attributes_table_for opportunity do
				row :content
			end
		end

	end

	sidebar "Datas", :only => :show do
		attributes_table_for opportunity do
			rows :beginning, :result, :end_subscription
		end
	end

	form html: { multipart: true } do |f|
		tabs do
			tab "Basic Details" do
				columns do
					column span: 2 do
					f.inputs  do
						f.input :title
						f.input :content
						f.input :featured_image,:as => :file, :hint => image_tag(f.object.featured_image_url(:thumb))
					end
				end
				column do
					f.has_many :entry_manners do |entry_manner|
						entry_manner.inputs :entry_type
						entry_manner.inputs :content
					end
				end
			end
		end
			tab "Cronograma" do
				panel 'Markup' do
					"The following can be used in the content below..."
				end
				f.inputs 'Inline Forms', :class => "as_inline_form" do
					f.input :beginning, :as => :string, :input_html => {:class => 'datepicker hasDatePicker'}
					f.input :end_subscription, :as => :string, :input_html => {:class => 'datepicker hasDatePicker'}
					f.input :result, :as => :string, :input_html => {:class => 'datepicker hasDatePicker'}
				end
			end

			tab "Prêmios e Taxas" do
				f.has_many :grants do |grant|
					grant.inputs :name
					grant.inputs :description
					grant.has_many :prizes do |prize|
						prize.inputs :exact_value
						prize.inputs :description    
						prize.inputs :value    
					end
				end
			end
			tab "Documentos" do
				f.has_many :docs do |f|
					f.input :doc_type       
					f.input :description
					f.input :doc, :as => :file
				end
			end

		end
		f.actions
	end
end
