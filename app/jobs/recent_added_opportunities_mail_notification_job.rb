class RecentAddedOpportunitiesMailNotificationJob
  include SuckerPunch::Job

  def perform(user_id, recent_opportunities)
  	user = User.find(user_id)
    NotificationMailer.recent_opportunities(user, recent_opportunities).deliver_now
  end
end