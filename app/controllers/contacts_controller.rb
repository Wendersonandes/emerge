class ContactsController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

	layout "wide"

  def new
    @contact = Contact.new
    prepare_meta_tags title: "Contato", description: view_context.t(:short_description, scope: :app)
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    user = @contact
    if @contact.deliver
      ContactResponseMailer.thanks_contact(user).deliver
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
