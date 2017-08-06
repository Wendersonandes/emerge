class NotificationMailerPreview < ActionMailer::Preview

  def recent_opportunities
		NotificationMailer.recent_opportunities(user = User.last, Opportunity.limit(2))
  end

end
