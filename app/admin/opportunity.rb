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
		:category_list => [],
		:entry_manners_attributes => [:id, :opportunity_id, :content, :entry_type, :_destroy],
		:docs_attributes => [	:id, 
													:opportunity_id, 
													:language, 
													:doc_type, 
													:doc, 
													:doc_remote_url, 
													:description, 
													:_destroy],
		:taxes_attributes => [ :id, 
													 :opportunity_id, 
													 :value, 
													 :value_currency, 
													 :description, 
													 :tax_type, 
													 :_destroy], 
		:grants_attributes => [ :id, 
														:name, 
														:description, 
														:quantity, 
														:opportunity_id, 
														:_destroy, 
														:prizes_attributes => [	:id, 
																										:opportunity_id, 
																										:grant_id, 
																										:value, 
																										:value_currency, 
																										:description, 
																										:prize_type_list , 
																										:exact_value, 
																										:_destroy]]

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

		def create
			submit_status = permitted_params[:commit].parameterize.underscore
			@opportunity = Opportunity.new(permitted_params[:opportunity])
			if submit_status.include?('publish')
				@opportunity.publish
			end
			super do |format|
				if submit_status.include?('save_and_edit')
					redirect_to edit_admin_opportunity_path(resource) and return if resource.valid?
				end
      end

		end

		def update
      submit_status = permitted_params[:commit].downcase

      if resource.errors.empty? && submit_status.include?('publish')
				resource.publish
        @opportunity = resource
      end

      super
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
						f.input :url_source
						f.input :content
						f.input :featured_image,:as => :file, :hint => image_tag(f.object.featured_image_url(:thumb))
						f.input :category_list, :as => :select2_multiple,
																		:collection => ActsAsTaggableOn::Tagging.where(:context => :categories).joins(:tag).select('DISTINCT tags.name').map{ |x| x.name},
																		:input_html => { :class => "select2-input chosen", :style => "width:80% height:200px"}

										
					end
				end
				column do
					f.has_many :entry_manners, :allow_destroy => true do |entry_manner|
						entry_manner.inputs do
							entry_manner.input :entry_type
							entry_manner.input :content, :as => :text, :input_html => { :class => 'autogrow', :rows => 5 }
						end
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
				f.has_many :grants, :allow_destroy => true do |grant|
					grant.inputs :name
					grant.inputs :description
					grant.has_many :prizes, :allow_destroy => true do |prize|
						prize.inputs do
							prize.input :exact_value

							prize.input :prize_type_list, :as => :select2,
							:collection => ActsAsTaggableOn::Tagging.where(:context => :prize_types).joins(:tag).select('DISTINCT tags.name').map{ |x| x.name},
							:input_html => { :class => "select2-input chosen", :style => "width:20%"}
							prize.input :value, :input_html => {:style => "width:20%"}
							prize.input :description


						end
						    
					end
				end

				f.has_many :taxes, :allow_destroy => true do |tax|
					tax.inputs :tax_type
					tax.inputs :description
					tax.inputs :value
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
		f.actions do
			f.action  :submit
			f.action :submit, label: "Publish"
			f.action  :cancel, :wrapper_html => { :class => 'cancel'}
		end
	end
end
