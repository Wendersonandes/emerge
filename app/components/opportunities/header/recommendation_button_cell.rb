module Opportunities
	module Header
		class RecommendationButtonCell < Cell::ViewModel

			def show
				render
			end

			def recommend
				render
			end

			def destroy_recommendation
				render
			end

			def render_recommendation_button
				if current_user
					if model.evaluation_by(:recommendation, current_user)
						render :destroy_recommendation
					else
						render :recommend
					end
				end
			end

			def current_user
				options[:context][:current_user]
			end
		end
	end
end
