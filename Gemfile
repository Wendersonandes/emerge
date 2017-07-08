source 'https://rubygems.org'

ruby '2.2.6'
gem 'rails', '~> 4.2.8'

#
# PLATFORM SPECIFIC
#
# OSX
gem 'rb-fsevent', group: [:development, :test]        # monitor file changes without hammering the disk
gem 'terminal-notifier-guard', group: [:development]  # notify terminal when specs run
gem 'terminal-notifier', group: [:development]

# Monitoring
gem 'rack-timeout', '~> 0.1.0beta4'
gem 'newrelic_rpm'
gem 'airbrake', '~> 3.2.1'         # use with airbrake.io or errbit
# gem 'airbrake_user_attributes'  # use with self-hosted errbit; see config/initializers/airbrake.rb
# gem 'rack-google-analytics'

# Data
gem 'pg'
gem 'dalli'                     # memcached

# Assets
gem 'sass-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'uglifier'
gem 'headjs-rails'
gem 'social-share-button'
gem 'select2-rails'
# Javascript
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'nprogress-rails'
gem 'client_side_validations', '~> 4.2', '>= 4.2.3'
gem 'client_side_validations-simple_form', '~> 3.4'
gem 'client_side_validations-formtastic', :github => "runtastic/client_side_validations-formtastic"
gem 'impressionist', '<= 1.5.1'
gem 'acts-as-taggable-on', '~> 3.4.2'
gem 'acts_as_follower', '~> 0.2.1'
gem 'local_time', '~> 1.0', '>= 1.0.3'
gem 'redcarpet', '~> 3.3', '>= 3.3.4'
# Admin
gem 'activeadmin', '~> 1.0'
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2'

#SEO stuff
gem 'meta-tags'

#Reputation System
gem 'activerecord-reputation-system', github: 'twitter/activerecord-reputation-system', :branch => "master"
gem "icalendar"
# Pagination
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'coffee-rails'
# Design
gem 'bootstrap-sass'
# Email
gem 'premailer-rails'
gem 'mail_form', '~> 1.5.0'
gem 'gibbon', github: "amro/gibbon"
gem 'sendgrid', '~> 1.2', '>= 1.2.4'

# Authentication
gem 'devise'
gem 'cancancan', '~> 1.9'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-linkedin'
# Workers
gem 'devise-async'
gem 'sinatra', require: false
gem 'sidekiq'

# Utils
gem 'addressable'
gem 'settingslogic'
gem 'pg_search', '~> 0.7.8'
gem 'fastimage'
gem 'image_processing'
gem 'mini_magick'
gem 'shrine'
gem 'aws-sdk', '~> 2.1'
gem 'roda'

gem 'responders', '~> 2.3'
gem 'active_model_serializers', '~> 0.10.5'
gem 'money-rails'
gem 'figaro', '~> 1.0.0'
gem 'rolify', '~> 5.0'
gem 'sucker_punch', '~> 2.0'
gem 'ranked-model'
gem 'trailblazer-cells'
gem 'cells-erb'
gem 'cells-rails'

group :development do
  # Docs
  gem 'sdoc', require: false    # bundle exec rake doc:rails
  # Errors
	gem 'better_errors'
  # Guard
  gem 'guard-rspec'
end

group :development, :test do
  # Use spring or zeus
  gem 'spring'                  # keep application running in the background
  gem 'spring-commands-rspec'
  # Debugging
  gem 'pry-rails'               # adds rails specific commands to pry
  gem 'pry-byebug'              # add debugging commands to pry
  gem 'pry-stack_explorer'      # navigate call stack
  gem 'awesome_print'           # pretty pring debugging output

  # Testing
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'capybara-webkit'

  # Logging
  gem 'quiet_assets'
end

group :test do
  gem 'minitest'                # include minitest to prevent require 'minitest/autorun' warnings

  # Helpers
  gem 'shoulda-matchers'
  gem 'database_cleaner'

  # Coverage
  gem 'simplecov', require: false
  gem 'rspec-sidekiq'
  gem 'rspec-activemodel-mocks'
end

group :production do
  gem 'memcachier'              # heroku add-on for auto config of dalli
  gem 'unicorn'
  gem 'rails_12factor'          # https://devcenter.heroku.com/articles/rails4
end
