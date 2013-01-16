Devise::Async.setup do |config|
  config.backend = :delayed_job
  #config.mailer  = "MyCustomMailer"
  #config.queue   = :my_custom_queue
end
