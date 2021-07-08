class SingleCompletedServiceJob < ApplicationJob
  queue_as :default

  def perform(account, recipient)
    TextMessage.new()
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = "#{Rails.application.credentials.dig(:twilio, :from_number)}" # Your Twilio number
    to = "#{recipient.phone_number}"

    client.messages.create(
      from: from,
      to: recipient.phone_number,
      body: "
        \nJustin, \n give me my money man.
      "
    )
  end
end
