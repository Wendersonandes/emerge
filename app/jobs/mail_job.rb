class MailJob
  include SuckerPunch::Job

  def perform(user_id)
  	user = User.find(user_id)
    ContactResponseMailer.thanks_contact(user).deliver_now
  end
end