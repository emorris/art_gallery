class ContactMailer < ApplicationMailer
   default to: "w.daninsky.beats@gmail.com"
  def form_send(email, subject, message)
    @message = message
    @email = email
    mail(
      from: email, 
      subject: "From Contact Form : #{subject}",
      reply_to:email
    )
  end
end
