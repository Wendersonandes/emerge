class ClosingOpportunitiesMailNotificationJob
  include SuckerPunch::Job

  def perform(user_id, recent_opportunities)
  	user = User.find(user_id)
    NotificationMailer.closing_opportunities(user, recent_opportunities).deliver_now
  end
end