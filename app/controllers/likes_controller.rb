class LikesController < ApplicationController
	def create
<<<<<<< HEAD
    puts "possei"
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.recommends(@opportunity)
#		respond_to do |format|
#      format.js
#		end
=======
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.recommends(@opportunity)
		respond_to do |format|
      format.js 
		end
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
	end

	def destroy
		@opportunity = Opportunity.find(params[:opportunity_id])
		current_user.person.stop_recommended(@opportunity)
<<<<<<< HEAD
#		respond_to do |format|
#      format.js
#		end
=======
		respond_to do |format|
      format.js
		end
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
	end

end
