VkontakteApi.configure do |config|
  config.app_id       = '6703822'
  config.app_secret   = 'E0TfENEKyaBPGuapEgI1'
  config.redirect_uri = ENV['root_uri'] + '/callback'
  config.logger = Rails.logger
end