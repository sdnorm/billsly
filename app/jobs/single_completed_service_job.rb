class SingleCompletedServiceJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.send_message
  end

end
