class OpportunitiesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy, :publish, :recommend,:destroy_recommendation, :export_opportunity]
  impressionist :actions=>[:show]

  def index
    if params[:tag].present?
      @opportunities = Opportunity.tagged_with(params[:tag]).page(params[:page]).per(5)
		else
			@opportunities = Opportunity.order('created_at DESC').page(params[:page]).per(5)
		end
    respond_with(@opportunities)

    prepare_meta_tags title: "Oportunidades abertas para artistas", image: view_context.asset_url("facebookShareImage.png"), og: { image: view_context.image_url("facebookShareImage.png"),title: "Oportunidades abertas para artistas", description: "Conecte-se a infinitas possibilidades em Artes Visuais."}
  end


  def show
		@opportunity = Opportunity.find(params[:id])
		@new_comment = Comment.build_from(@opportunity, current_user.id, "")
    impressionist(@opportunity)
    prepare_meta_tags title: @opportunity.title, 
											description: @opportunity.summary || view_context.truncate_html(@opportunity.content, length: 150, omission: "..."), 
											image: @opportunity.featured_image_url(:original) || view_context.image_url("alone-clouds-hills-1909-527x350.jpg"), 
											og: {	title: @opportunity.title, 
														description: @opportunity.summary || view_context.truncate_html(@opportunity.content, length: 150, omission: "..."), 
														image: @opportunity.featured_image_url(:original) || view_context.image_url("alone-clouds-hills-1909-527x350.jpg")}
    #@opportunity_categories = @opportunity.category_list.map{|tagging|{:name => tagging }}.to_json
    respond_with(@opportunity)
  end

  # GET /opportunity/new
  def new
    @opportunity = Opportunity.new
  end

  # GET /opportunity/1/edit
  def edit
  end

  # POST /opportunity
  # POST /opportunity.json
  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.author = current_user

    if params[:publish]
      @opportunity.publish
		end
    #@opportunity.create_activity :new_opportunity_added_to_program

    respond_to do |format|
      if @opportunity.save
        format.js 
				format.html { render :nothing => true } 
        format.json { head :ok }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
				format.js
      end
    end
  end

  # PATCH/PUT /opportunity/1
  # PATCH/PUT /opportunity/1.json
  def update
    if params[:publish]
			@opportunity.publish
    end

    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity/1
  # DELETE /opportunity/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunity_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    @opportunity.publish
		@opportunity.save!
    render :nothing => true
  end

  def searchOpportunities
    @opportunities = Opportunity.open.search(params[:query])
  end

	def following
		@opportunities = current_user.person.following_by_type("Opportunity").page(params[:page]).per(6)
    respond_with(@opportunities)
	end

	def user_recommended
		@opportunities = Opportunity.evaluated_by(:recommendation, current_user).page(params[:page]).per(6)
	end

	def recommend
		value = 1
		@opportunity.add_or_update_evaluation(:recommendation, value, current_user)
		respond_to do |format|
			format.js
		end
	end

	def destroy_recommendation
		@opportunity.delete_evaluation(:recommendation, current_user)
		respond_to do |format|
			format.js
		end
	end

	def export_opportunity
		@calendar = Icalendar::Calendar.new
		event = Icalendar::Event.new
		event.dtstart = @opportunity.beginning
		event.dtend = @opportunity.end_subscription
		event.summary = @opportunity.title
		event.description = @opportunity.summary
		@calendar.add_event(event)
		@calendar.publish
    headers["Content-Type"] = "text/calendar; charset=UTF-8;"
    headers["Content-Disposition"] = "attachment;" \
        "filename = #{@opportunity.title.tr(' ', '_')}.ics"
    render text: @calendar.to_ical
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params.require(:opportunity).permit(:id,:author_id,:url_source, :featured_image, :featured_image_remote_url, :program_id, :title, :beginning, :end_subscription, :result, :extended, :content, :entry_manner,:rules, :category_list, :url_subscription_attributes =>[:id, :url], :email_subscription_attributes =>[:id, :email], :address_subscription_attributes =>[ :id,:address], :docs_attributes => [:id, :opportunity_id, :language, :doc_type, :doc, :doc_remote_url, :description, :_destroy],:taxes_attributes => [:id, :opportunity_id, :value, :value_currency, :description, :_destroy], :grants_attributes => [:id, :name, :description, :quantity, :opportunity_id, :_destroy, :prizes_attributes => [:id ,:opportunity_id, :grant_id, :value, :value_currency, :description, :prize_type_list , :exact_value, :_destroy]])
    end
end
