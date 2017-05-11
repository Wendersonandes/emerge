class OpportunitiesController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy, :publish]
  impressionist :actions=>[:show]

  def index

    @filter_tags = ["Fotografia", "Residência", "Pintura", "Performance"]

    if params[:tag].present?
      @opportunities = Opportunity.open.tagged_with(params[:tag]).page(params[:page]).per(5)
      @opportunities_counter = Opportunity.open.tagged_with(params[:tag]).count
    elsif params[:filter].present?
      if params[:filter] == "maybe"
        tags = current_user.person.profile_skill_list
        @opportunities = Opportunity.open.tagged_with(tags, :on => :categories, :any => true).page(params[:page]).per(5)
      elsif params[:filter] == "most_viewed"
        @opportunities = Opportunity.most_viewed.page(params[:page]).per(5)
      else params[:filter] == "closing"
        @opportunities = Opportunity.closures.page(params[:page]).per(5)
      end
    else
      @opportunities = Opportunity.open.order('created_at DESC').page(params[:page]).per(5)
      @opportunities_counter = Opportunity.open.count
    end

    # @opportunities = Opportunity.all
    respond_with(@opportunities)

    # prepare_meta_tags title: "Oportunidades abertas para artistas", image: view_context.asset_url("facebookShareImage.png"), og: { image: view_context.image_url("facebookShareImage.png"),title: "Oportunidades abertas para artistas", description: "Conecte-se a infinitas possibilidades em Artes Visuais."}
  end


  def show
		@opportunity = Opportunity.find(params[:id]).decorate
    #impressionist(@opportunity)
    #prepare_meta_tags title: @opportunity.title, description: @opportunity.summary || view_context.truncate_html(@opportunity.content, length: 150, omission: "..."), image: @opportunity.featured_image_url(:original) || view_context.image_url("alone-clouds-hills-1909-527x350.jpg"), og: {title: @opportunity.title, description: @opportunity.summary || view_context.truncate_html(@opportunity.content, length: 150, omission: "..."), image: @opportunity.featured_image_url(:original) || view_context.image_url("alone-clouds-hills-1909-527x350.jpg")}
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
      @opportunity.updated_at = Time.zone.now
      @opportunity.created_at ||= @opportunity.updated_at
      @opportunity.published_at = @opportunity.updated_at
    end
    #@opportunity.create_activity :new_opportunity_added_to_program

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: "Obrigado por compartilhar! Sua colaboração em breve estará disponível para outros usuários." }
        format.js { flash[:notice] = "Obrigado por compartilhar! Sua colaboração em breve estará disponível para outros usuários." }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
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
