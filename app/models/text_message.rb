# == Schema Information
#
# Table name: text_messages
#
#  id                      :bigint           not null, primary key
#  batch_or_single_service :bigint
#  body                    :text
#  recipient_number        :string
#  successfully_delivered  :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  client_id               :bigint           not null
#  reminder_id             :bigint
#
# Indexes
#
#  index_text_messages_on_account_id   (account_id)
#  index_text_messages_on_client_id    (client_id)
#  index_text_messages_on_reminder_id  (reminder_id)
#
class TextMessage < ApplicationRecord

  belongs_to :account
  belongs_to :client
  belongs_to :reminder

  enum batch_or_single_service: {
    single: 0,
    batched: 1
  }

  def set_up_twilio
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = "#{Rails.application.credentials.dig(:twilio, :from_number)}" # Your Twilio number
  end

  def send_message
    text_body_content
    # self.update(body: text_body_content)
    set_up_twilio
    @client.messages.create(
      from: @from,
      to: self.recipient_number,
      body: self.body
    )
  end

  def text_body_content
    case self.batch_or_single_service
    when "single"
      single_job_text_message_body
    end
  end

  def single_job_text_message_body
    if self.client.client_profiles.first.dollar_amount.nil?
      self.update(body: "Hey #{self.client.first_name}!\n#{self.account.name} completed your service today. Please provide prompt payment via the links below.\n
      #{payment_links_for_text}\nThanks!")
    else
      self.update(body: "Hey #{self.client.first_name}!\n#{self.account.name} completed your service today. Please provide prompt payment via the links below.\n
      #{self.client.client_profiles.first.dollar_amount}\n
      #{payment_links_for_text}\nThanks!")
    end
  end

  def payment_links_for_text
    payment_link_string = ""
    self.account.sp_payment_links.each do |p|
      payment_link_string += "#{p.link}\n"
    end
    payment_link_string
  end
  
end
