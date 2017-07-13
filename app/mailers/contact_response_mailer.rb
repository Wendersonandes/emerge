class ContactResponseMailer < ActionMailer::Base
	layout 'transactional_email'
  default from: "contato@emerge.art.br"

  def thanks_contact(user)
  	@user = user
  	mail(
        :to => @user.email, 
        :subject => "Obrigado por entrar em contato com o Emerge",
        )
  	
  end
end
