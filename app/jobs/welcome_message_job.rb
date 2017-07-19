class WelcomeMessageJob
  include SuckerPunch::Job

  def perform(user)
		UserMailer.welcome_email(user).deliver_now
  end
end
