class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.config_for(:app_config)['email']
  layout 'mailer'
end
