# == Schema Information
#
# Table name: completed_services
#
#  id                  :bigint           not null, primary key
#  dollar_amount       :decimal(, )
#  type_of_reminder    :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :bigint
#  client_profile_id   :bigint
#  provided_service_id :bigint
#
# Indexes
#
#  index_completed_services_on_account_id           (account_id)
#  index_completed_services_on_client_profile_id    (client_profile_id)
#  index_completed_services_on_provided_service_id  (provided_service_id)
#
class CompletedService < ApplicationRecord

  belongs_to :account 
  belongs_to :client_profile

  before_save :get_dollar_amount
  after_create :send_reminder

  enum type_of_reminder: {
    text: 0,
    email: 1,
    both: 2
  }

  def get_dollar_amount
    self.dollar_amount = self.client_profile.dollar_amount
  end

  def send_reminder
    reminder = Reminder.create(
      account_id: self.account.id,
      client_id: self.client_profile.client.id,
      completed_service_id: self.id
    )
    case self.client_profile.client.preferred_contact_method
    when "text"
      # puts "yes"
      reminder.single_service_text
    when "email"
      reminder.single_service_email
    when "both"
      reminder.single_service_text
      reminder.single_service_email
    else
      reminder.single_service_text
    end
  end

end
