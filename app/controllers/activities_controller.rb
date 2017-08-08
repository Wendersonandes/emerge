class ActivitiesController < ApplicationController

	def feed
    @activities = PublicActivity::Activity.order("created_at DESC").all
    respond_to do |format|
      format.html
    end
  end
end
