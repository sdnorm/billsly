# == Schema Information
#
# Table name: reminders
#
#  id                   :bigint           not null, primary key
#  description          :bigint
#  message              :text
#  opened               :boolean          default(FALSE)
#  read                 :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_id           :bigint           not null
#  client_id            :bigint           not null
#  completed_service_id :bigint
#
# Indexes
#
#  index_reminders_on_account_id            (account_id)
#  index_reminders_on_client_id             (client_id)
#  index_reminders_on_completed_service_id  (completed_service_id)
#
class Reminder < ApplicationRecord

  # belongs_to :account_client
  # self.ignored_columns = ["account_client_id"]

  belongs_to :account
  belongs_to :client
  belongs_to :completed_service

  has_many :text_messages

  enum description: {
    text: 0,
    email: 1
  }

  # def self.test_email
  #   WorkCompleteMailer.test().deliver
  # end

  def single_service_email
    SingleCompletedJobMailer.with(recipient: self.client, account: self.account).single_job_email.deliver_now
  end

  def single_service_text
    puts " "
    puts "22222222222"
    puts " "
    text = TextMessage.new(
      recipient_number: self.client.phone_number,
      account_id: self.account_id,
      client_id: self.client_id,
      batch_or_single_service: "single",
      reminder_id: self.id
    )
    text.save!
    puts " "
    puts "here"
    puts text.inspect
    puts " "
    SingleCompletedServiceJob.perform_later(text)
  end
  
end
