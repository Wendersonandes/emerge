class CollectionController < ApplicationController

  def person_following_opportunities
  	@opportunities = current_user.person.following_by_type("Opportunity").page(params[:page]).per(6)
  end

end
