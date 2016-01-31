class ContactMailer < ApplicationMailer
  default to: Rails.application.config_for(:app_config)['email']
  def form_send(email, subject, message)
    @message = message
    @email = email
    mail(
      from: email, 
      subject: "From Contact Form : #{subject}",
      reply_to: email
    )
  end
end
