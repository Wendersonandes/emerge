class FollowOpportunitiesController < ApplicationController
	def create
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.follow(@opportunity)
		respond_to do |format|
      format.js { flash[:notice] = "Esta oportunidade foi adicionada a sua coleção..." }
    end
	end

	def destroy
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.stop_following(@opportunity)

		respond_to do |format|
      format.js { flash[:notice] = "Esta oportunidade foi retirada a sua coleção..." }
    end
	end
end