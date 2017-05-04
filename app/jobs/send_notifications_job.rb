class SendNotificationsJob
  include SuckerPunch::Job

  def initialize(opportunity_id=nil)
    #@opportunity_id = opportunity_id
    @opportunity_id = 361
  end

  #def perform
  #  puts "Claudiney Barbosa Veloso"
  #end

  def newly_created_opportunity
    # users = User.on_new_opportunity_subscriber
    user = User.find(97)
    opportunity = Opportunity.find(@opportunity_id)
    #NotificationMailer.newly_created_opportunities(user, opportunity).deliver_now
    opportunity.opportunity_email_notification.update_recently_added
    puts "Notificação oportunidade criada recentemente"
  end

  def closer_to_closure_for_followers
    #opportunity = Opportunity.find(@opportunity_id)
    opportunity = Opportunity.closing_in_7_day
    user = User.on_new_opportunity_subscriber.map(&:id)
    opportunity.followers.each do |follower|
      if user.include?(follower.id)
        #NotificationMailer.newly_created_opportunities(user, opportunity).deliver_noiw
      end
    end
    opportunity.opportunity_email_notification.update_follower_closure
    puts "Notificação oportunidade criada para seguidores"
  end


  def closer_to_closure_for_not_followers
    opportunity = Opportunity.closing_in_5_day
    user = User.on_new_opportunity_subscriber.map(&:id)
    opportunity.each do |follower|
      if user.include?(follower.id)
        #NotificationMailer.newly_created_opportunities(user, opportunity).deliver_noiw
      end
    end
    opportunity.opportunity_email_notification.update_closure
    puts "Notificação oportunidade criada para não seguidores"
  end

end


