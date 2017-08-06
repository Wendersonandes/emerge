class NotificationMailer < ActionMailer::Base
  layout 'emails/testing'
  default from: "\"Emerge\" <contato@emerge.art.br>"

  def recent_opportunities(user, recent_opportunities)
  	@user = user
  	@recent_opportunities = recent_opportunities
  	mail(
        :to => @user.email,
        :subject => "Oportunidades adicionadas recentemente no Emerge que podem te interessar"
      )
  end

  def closing_opportunities(user, closing_opportunities)
    @user = user
    @closing_opportunities = closing_opportunities
    mail(
        :to => @user.email,
        :subject => "Oportunidades próximas do encerramento no Emerge que podem te interessar"
      )
  end

  def testing_email(user, opportunity, recent_opportunities)
    @user = user
    @opportunity = opportunity
		@recent_opportunities = recent_opportunities
    mail( :to => @user.email,
          :subject => "Oportunidades próximas do encerramento no Emerge que podem te interessar"
      ) do |format|
      format.html { render layout: 'email' }
    end
  end

  def newly_created_opportunities(user, opportunity)
    @user = user
    @newly_opportunity = opportunity
    mail(
      :to => @user.email,
      :subject => "Uma nova oportunidade foi adicionada no Emerge")
  end

end
