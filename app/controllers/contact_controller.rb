class ContactController < ApplicationController
  def index
    ContactMailer.form_send(
      params['email'],
      params['subject'],
      params['message']
    ).deliver_now
    render json: {}
  end
end