class TextMessage < ApplicationRecord 

  class << self

    def set_up_twilio
      @account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
      @auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      @from = "#{Rails.application.credentials.dig(:twilio, :from_number)}" # Your Twilio number
    end
  
    def send(account, recipient, body)
      set_up_twilio
      to = "#{recipient.phone_number}"
      @client.messages.create(
        from: @from,
        to: recipient.phone_number,
        body: body
      )
    end

  end
  
end
