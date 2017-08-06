class ContactResponseMailer < ActionMailer::Base
  layout 'emails/testing'
  default from: "\"Emerge\" <contato@emerge.art.br>"

  def thanks_contact(user)
  	@user = user
  	mail(
        :to => @user.email, 
        :subject => "Obrigado por entrar em contato com o Emerge",
        )
  	
  end
end
