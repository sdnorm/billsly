class SingleCompletedServiceJob < ApplicationJob
  queue_as :default

  def perform(message, email_or_text)
    # TextMessage.new()
    case email_or_text
    when "text"
      message.send
    when "email"
      message.send
    end
  end

end
