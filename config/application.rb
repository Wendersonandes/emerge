require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
# ==== OR ====
# require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StarterKit
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Use sql instead of ruby to support case insensitive indices for postgres
    config.active_record.schema_format = :sql

    I18n.enforce_available_locales = true
    config.i18n.available_locales = [:en, :"pt-BR"]

    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :'pt-BR'
    config.i18n.locale = :'pt-BR'
    config.assets.initialize_on_precompile = false

    # Serve vendor fonts
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

    config.assets.precompile += %w( head )

    config.to_prepare do
      Devise::Mailer.layout Rails.application.config.settings.mail.layout
    end
  end
end

require File.expand_path('../settings', __FILE__)
