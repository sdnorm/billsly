class SingleCompletedServiceJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.send
  end

end
