if defined? Devise::Async
  Devise::Async.setup do |config|
    # config.enabled = false
    config.backend = :sucker_punch
    config.queue = :mailer
  end
end
