
Devise.setup do |config|
  config.omniauth :twitter, TWITTER_CONFIG['consumer_key'], TWITTER_CONFIG['consumer_secret']
  config.secret_key = '77f039aed3095798f5eb1cb0118e964ce5cde43c85ec8df9a5c990b398dadd8c0449bf7ba0e4ee0c716d809682d51299f1ea679558c049094648a273f35e7613'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
