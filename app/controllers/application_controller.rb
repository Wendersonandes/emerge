require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  if ENV['BASIC_AUTH']
    user, pass = ENV['BASIC_AUTH'].split(':')
    http_basic_authenticate_with name: user, password: pass
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json?  }

  # Devise, require authenticate by default
  before_filter :authenticate_user!
	before_action :prepare_meta_tags, if: "request.get?"

  # CanCan, check authorization unless authorizing with devise
  #check_authorization unless: :skip_check_authorization?

  # Special handling for ajax requests.
  # Must appear before other rescue_from statements.
  rescue_from Exception, with: :handle_uncaught_exception

  include CommonHelper
  include ErrorReportingConcern
  include AuthorizationErrorsConcern

  def prepare_meta_tags(options={})
    site        = "EMERGE"
    title       = [controller_name, action_name].join(" ")
    description = view_context.t(:short_description, scope: :app)
    current_url = request.url

    # Let's prepare a nice set of defaults

    defaults = {
      site:        site,
      title:       title,
      description: description,
			icon: [{:href => view_context.asset_url('favicon.ico'), :type => 'image/png'}],
      keywords:    %w[arte contemporaneo artista editais edital residencia visual editais premios oportunidades artes plásticas salões bolsa],

      og:          {url: current_url,
                    site_name: site,
                    title: title,
                    description: description,
                    type: 'website'}
    }


    options.reverse_merge!(defaults)


    set_meta_tags options

  end


  protected

  def skip_check_authorization?
    devise_controller? || is_a?(RailsAdmin::ApplicationController)
  end

  # Reset response so redirect or render can be called again.
  # This is an undocumented hack but it works.
  def reset_response
    self.instance_variable_set(:@_response_body, nil)
  end

  # Respond to uncaught exceptions with friendly error message during ajax requets
  def handle_uncaught_exception(exception)
    if request.format == :js
      report_error(exception)
      flash.now[:error] = Rails.env.development? ? exception.message : I18n.t('errors.unknown')
      render 'layouts/uncaught_error.js'
    else
      raise
    end
  end
end
