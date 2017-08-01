module Opportunities
	module Header
		class FollowButtonCell < Cell::ViewModel
			include Escaped

			def show
				render
			end

			def follow
				render
			end

			def stop_following
				render
			end

			def render_follow_button
				if current_user
					if model.followed_by?(current_user.person) 
						render :stop_following 
					else
						render :follow
					end
				end
			end

			def stop_following_link
				opportunity_follow_opportunity_path(model.to_param, current_user.person.get_follow(model).id)
			end

			def start_following_link
				opportunity_follow_opportunities_path(model.to_param.to_s)
			end

			def current_user
				options[:context][:current_user]
			end
		end
	end
end
