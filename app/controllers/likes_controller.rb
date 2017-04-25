class LikesController < ApplicationController
	def create
    puts "possei"
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.recommends(@opportunity)
#		respond_to do |format|
#      format.js
#		end
	end

	def destroy
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.stop_recommended(@opportunity)
#		respond_to do |format|
#      format.js
#		end
	end

end
