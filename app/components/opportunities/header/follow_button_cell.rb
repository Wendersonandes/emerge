module Opportunities
	module Header
		class FollowButtonCell < Cell::ViewModel

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

			def current_user
				options[:context][:current_user]
			end
		end
	end
end
